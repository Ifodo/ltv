
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagostv/more.dart';
import 'package:lagostv/news.dart';
import 'package:lagostv/services/webservices.dart';
import 'package:lagostv/video_stream.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            /*leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),*/
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/logo_trans_new.png',
                    fit: BoxFit.contain, height: 45),
                //const Text('LTV'),
              ],
            ),
            backgroundColor: const Color(0xff000000),
            elevation: 10.0,
            actions: [
              InkWell(
                child: const Padding(
                  padding: EdgeInsets.only(right: 10.0, top: 2.0),
                  child: Column(
                    children: [
                      Icon(Icons.live_tv, size: 35, color: Colors.white,),
                      Text('Live Stream')
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const VideoStream(),
                    ),
                  );
                },
              ),
              InkWell(
                child: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.more_vert_outlined, size: 40, color: Colors.white,),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const More(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
          child: SizedBox(
            /*decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/banner.png"),
                fit: BoxFit.cover,
              ),
            ),*/
            height: screenHeight,
            child: Center(
              child: Column(
                children: [
                  /*const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 5.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('Lagos State Television',
                            style: TextStyle(
                                color: Color(0xff520e9f),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold))),
                  ),*/
                  /*Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      color: const Color(0xffb61005),
                      elevation: 15.0,
                      margin: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: screenWidth * 1.2,
                        height: screenHeight / 3.5,
                        child: FutureBuilder(
                            future: nowOnAirData(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                print('snapshot: ${snapshot.data}');
                                var imgData = snapshot.data.oapData.oapPicture;
                                var oapImg = 'http://159.89.137.63/uploads/$imgData';
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: FadeInImage.assetNetwork(
                                    height: screenHeight - screenHeight / 1.2,
                                    width: screenWidth,
                                    image: oapImg,
                                    placeholderScale: 1,
                                    fit: BoxFit.fill,
                                    placeholder: 'assets/logo_trans_new.png',
                                  ),
                                  //Image.asset(circularProgressIndicator, scale: 10),
                                );
                              } else if (snapshot.hasError) {
                                return const Center(
                                    child: CupertinoActivityIndicator(
                                  color: Color(0x50857b7b),
                                  radius: 60.0,
                                ));
                              } else {
                                return Container(
                                    width: 300,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      image: DecorationImage(
                                        image: AssetImage('assets/logo_trans.png'),
                                        fit: BoxFit.cover, // Adjust how the image is fitted inside the container
                                      ),
                                    ));
                              }
                            }),
                      )),*/
                  /*const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 0.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('Now On Air',
                            style: TextStyle(
                                color: Color(0xff520e9f),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold))),
                  ),*/
                  /*Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    color: const Color(0xffb61005),
                    elevation: 15.0,
                    child: SizedBox(
                      height: screenHeight / 10,
                      width: screenWidth * 0.95,
                      child: FutureBuilder(
                        future: nowOnAirData(),
                          builder: (BuildContext context, AsyncSnapshot snapshot){
                          if(snapshot.hasData){
                            var progTitle = snapshot.data.schedule.title;
                            var progStartTime = snapshot.data.schedule.start;
                            var progEndTime = snapshot.data.schedule.end;
                            return Padding(
                              padding: const EdgeInsets.only(top: 25.0, left: 25.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('$progTitle', style: const TextStyle(color: Colors.white, fontSize: 19.0)),
                                    Text('$progStartTime - $progEndTime', style: const TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            );
                          } else if(snapshot.hasError){
                            return const Center(
                                child: CupertinoActivityIndicator(
                                  color: Color(0xffffffff),
                                  radius: 30.0,
                                ));
                          } else {
                            return const Center(
                                child: CupertinoActivityIndicator(
                                  color: Color(0xffffffff),
                                  radius: 30.0,
                                ));
                          }

                          }),


                    ),
                  ),*/
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 0.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('Latest News',
                            style: TextStyle(
                                color: Color(0xff520e9f),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold))),
                  ),
                  const Expanded(child: News())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
