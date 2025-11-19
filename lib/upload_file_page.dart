import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UploadFilePage extends StatefulWidget {
  final String? name;
  final String? location;
  final String? description;

  const UploadFilePage({
    Key? key,
    this.name,
    this.location,
    this.description,
  }) : super(key: key);

  @override
  _UploadFilePageState createState() => _UploadFilePageState();
}

class _UploadFilePageState extends State<UploadFilePage> {
  bool _enabledGetFile = true;
  String? uploadProgress;
  final ImagePicker picker = ImagePicker();
  File? _image;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future getFile() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print('File uploaded response: $_image');
      } else {
        print('No image selected.');
      }
    });
  }

  void uploadFiles(BuildContext context) async {
    String fileName = basename(_image?.path ?? '');
    print("file name basename: $fileName");
    print("sender name : ${widget.name}");
    try {
      FormData formData = FormData.fromMap({
        "name": widget.name ?? '',
        "location": widget.location ?? '',
        "description": widget.description ?? '',
        "category": "ireport",
        "file": await MultipartFile.fromFile(_image!.path, filename: fileName),
      });
      Response response = await Dio().post(
          'http://159.89.137.63:80/api/upload_new_image_report',
          data: formData,
          onSendProgress: (actualBytes, totalBytes) {
            var percentage = actualBytes / totalBytes * 100;
            setState(() {
              uploadProgress = 'Uploaded... ${percentage.floor()} %';
            });
          });
      print('File uploaded response from server: $response');
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          backgroundColor: const Color(0xffb61005),
          message: response.data['display'] ?? 'File uploaded successfully',
        ),
      );
    } catch (e) {
      print('Exception $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffffffff),
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: const Color(0xff000000),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Community Report', style: TextStyle(color: Colors.white)),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        height: screenWidth / 2,
                        width: screenWidth / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: _image == null
                              ? Image.asset(
                            'assets/logo_trans_big.png',
                            width: 100,
                            height: 63,
                            fit: BoxFit.contain,
                          )
                              : Image.file(_image!),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xffb61005)),
                    elevation: MaterialStateProperty.all(10.0),
                    side: MaterialStateProperty.all(const BorderSide(color: Colors.black26)),
                    shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )),
                  ),
                  onPressed: _enabledGetFile ? getFile : null,
                  child: const Text('Select Image', style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xffb61005)),
                    elevation: MaterialStateProperty.all(10.0),
                    side: MaterialStateProperty.all(const BorderSide(color: Colors.black26)),
                    shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )),
                  ),
                  onPressed: _image != null ? () => uploadFiles(context) : null,
                  child: const Text('Upload Report', style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                const SizedBox(height: 15.0),
                Text(uploadProgress ?? 'No upload progress yet'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
