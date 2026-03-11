
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoStream extends StatefulWidget {
  const VideoStream({super.key});

  @override
  State<VideoStream> createState() => _VideoStreamState();
}

class _VideoStreamState extends State<VideoStream> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isPlayerInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse('https://ngvid.elektranbroadcast.com/hls/ltv/mystream.m3u8'),
      );

      await _videoPlayerController.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: 16 / 9,
        autoPlay: true,
        looping: false,
        allowFullScreen: true,
        allowMuting: true,
        showControls: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: const Color(0xffb61005),
          handleColor: const Color(0xffb61005),
          backgroundColor: Colors.grey,
          bufferedColor: Colors.white30,
        ),
        placeholder: Container(
          color: Colors.black,
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/logo_trans_new.png'),
                  fit: BoxFit.fitHeight,
                  height: 50,
                ),
                SizedBox(height: 16.0),
                CupertinoActivityIndicator(radius: 50.0, color: Colors.white),
                SizedBox(height: 16.0),
                Text(
                  'Stream Loading ... Lagos State Television',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.white, size: 50),
                const SizedBox(height: 16),
                Text(
                  'Error: $errorMessage',
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isPlayerInitialized = false;
                      _chewieController?.dispose();
                      _videoPlayerController.dispose();
                    });
                    _initializePlayer();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        },
      );

      if (mounted) {
        setState(() {
          _isPlayerInitialized = true;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isPlayerInitialized = true;
        });
        
        _showErrorDialog(e.toString());
      }
    }
  }

  void _showErrorDialog(String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black87,
        title: const Row(
          children: [
            Icon(Icons.error_outline, color: Colors.red, size: 30),
            SizedBox(width: 10),
            Text('Connection Error', style: TextStyle(color: Colors.white)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Unable to connect to the live stream.',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Possible reasons:',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 8),
            const Text(
              '• No internet connection',
              style: TextStyle(color: Colors.white70),
            ),
            const Text(
              '• Stream is currently offline',
              style: TextStyle(color: Colors.white70),
            ),
            const Text(
              '• Network timeout',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 12),
            Text(
              'Error details: $error',
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Go Back', style: TextStyle(color: Colors.white70)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffb61005),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _isPlayerInitialized = false;
                _chewieController?.dispose();
                _videoPlayerController.dispose();
              });
              _initializePlayer();
            },
            child: const Text('Retry', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color(0xff000000),
          title: const Text('Live Stream', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: _isPlayerInitialized && _chewieController != null
              ? Chewie(controller: _chewieController!)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Image(
                      image: AssetImage('assets/logo_trans_new.png'),
                      fit: BoxFit.fitHeight,
                      height: 50,
                    ),
                    SizedBox(height: 16.0),
                    CupertinoActivityIndicator(radius: 50.0, color: Colors.white),
                    SizedBox(height: 16.0),
                    Text(
                      'Initializing Stream ... Lagos State Television',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}