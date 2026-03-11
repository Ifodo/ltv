import 'package:flutter/material.dart';
import 'package:lagostv/home.dart';
import 'package:lagostv/video_stream.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          width: screenWidth,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(height: screenHeight / 5.5),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Image.asset('assets/logo_trans.png'),
              ),
              SizedBox(height: screenHeight / 5.5),

              SizedBox(
                width: screenWidth / 1.4,
                height: 45,
                child: ElevatedButton(
                  //shape: RoundedRectangleBorder(
                   //   borderRadius: BorderRadius.circular(12.0),
                   //   side: BorderSide(color: Colors.black26)
                  //),
                  //color: Color(0xff264796),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Color(0xff264796)),
                    elevation: WidgetStateProperty.all(10.0),
                    side: WidgetStateProperty.all(BorderSide(color: Colors.black26)),
                    shape: WidgetStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0),
                          ),
                        )),
                  ),
                  onPressed: _onPressedWLS,
                  child:
                  const Text('Watch Live Stream', style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    fontFamily: 'Gotham XLight'
                  )),
                ),
              ),
              SizedBox(height: 5.0),

              SizedBox(
                width: screenWidth / 1.4,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Color(0xff264796)),
                    elevation: WidgetStateProperty.all(10.0),
                    side: WidgetStateProperty.all(BorderSide(color: Colors.black26)),
                    shape: WidgetStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0),
                          ),
                        )),
                  ),
                  onPressed: _onPressedExplore,
                  child:
                  const Text('Explore', style: TextStyle(fontSize: 17, color: Colors.white, fontFamily: 'Gotham XLight')),
                ),
              ),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }

  _onPressedWLS() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const VideoStream()
        )

    );
  }

  void _onPressedExplore() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const Home()
        )
    );
  }


}
