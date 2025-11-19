import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class NewsArticle extends StatelessWidget {
  final String? title;
  final String? date;
  final String? content;
  final String? imageUrl;
  final String? url;

  const NewsArticle(
      {Key? key,
      @required this.title,
      @required this.date,
      @required this.content,
      @required this.imageUrl,
      @required this.url})
      : super(key: key);
  //const BlogArticles({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: const Color(0xff000000),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios)),
          title: const Text('News Article'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: const Color(0xff8558c1),
                elevation: 15.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage.assetNetwork(
                    height: screenHeight / 3.2,
                    width: screenWidth,
                    placeholder: const CupertinoActivityIndicator().toString(),
                    image: imageUrl!,
                    placeholderScale: 5,
                    fit: BoxFit.cover,
                  ),
                  //Image.asset(circularProgressIndicator, scale: 10),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                parse(title.toString()).documentElement!.text,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xff2a166f),
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0.0),
                  child: Text(
                    parse(content.toString())
                        .documentElement!
                        .text,
                    softWrap: true,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        height: 1.8,
                        color: Color(0xff2a166f),
                        fontSize: 17.0,
                        fontFamily: 'Gotham XLight',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
