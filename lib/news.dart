import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:html/parser.dart';
import 'package:lagostv/news_article.dart';
import 'package:lagostv/services/webservices.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var imageUrl;

    return SizedBox(
      width: screenWidth * 0.95,
      child: FutureBuilder(
          future: fetchWpPost(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Map wpPost = snapshot.data![index];
                    var mediaFile = wpPost['featured_media'];
                    if(mediaFile == 0){
                      imageUrl = '';
                    } else {
                      imageUrl = wpPost['_embedded']['wp:featuredmedia'][0]['source_url'];
                    }
                    print('IMMGES: $imageUrl}');
                    return InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        color: Colors.transparent,
                        elevation: 3.0,
                        child: SizedBox(
                          height: screenHeight / 5.5,
                          width: screenWidth * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: screenWidth / 3,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: DecorationImage(
                                      image: NetworkImage(imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      width: screenWidth / 2,
                                      child: Text(
                                        parse(wpPost['title']['rendered'])
                                            .documentElement!
                                            .text,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xff2a166f),
                                            fontFamily: 'Gotham XLight',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        GetTimeAgo.parse(DateTime.parse(wpPost['date'])),
                                        style: const TextStyle(
                                            fontSize: 13.0,
                                            color: Color(0xffcb1205),
                                            fontFamily: 'Gotham XLight',
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: (){
                        var imageUrls;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsArticle(
                                  url: wpPost['link'],
                                  title: wpPost['title']['rendered'],
                                  date: wpPost['date'],
                                  content: wpPost['content']['rendered'],
                                  imageUrl: mediaFile == 0 ? '' : wpPost['_embedded']
                                  ['wp:featuredmedia'][0]['source_url'],
                                )
                            )
                        );
                      },
                    );
                  });
            } else if (snapshot.hasError) {
              return const Center(
                  child: CupertinoActivityIndicator(
                    color: Color(0xff000000),
                    radius: 80.0,
                  )
              );
            } else {
              return const Center(
                  child: CupertinoActivityIndicator(
                    color: Color(0xff000000),
                    radius: 80.0,
                  )
              );
            }
          }),
    );
  }
}
