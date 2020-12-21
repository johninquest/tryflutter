import 'package:flutter/material.dart';
// import 'styles.dart';
import '../services/web.dart';
import 'dart:convert';
// import 'package:webfeed/webfeed.dart';
// import 'package:xml/xml.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String reqUrl =
        'https://newsapi.org/v2/top-headlines?apiKey=bc80aee5a6654843bd745e416bccc24d&country=de';
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('News Page'),
        ),
        body: Center(
          child: FutureBuilder(
            future: HttpRequestHandler().httpGet(reqUrl),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // print('This endpoint has data!');
                var rawData = snapshot.data.body;
                var parsedData = jsonDecode(rawData);
                List newsList = parsedData['articles'];
                return ListView.builder(
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      String newsSource = newsList[index]['source']['name'];
                      String newsTitle = newsList[index]['title'];
                      // var newsAuthor = newsList[index]['author'];
                      String newsUrl = newsList[index]['url'];
                      var newsImage = newsList[index]['urlToImage'];
                      return Card(
                        margin: EdgeInsets.all(10),
                        elevation: 0.0,
                        // shape: CircleBorder(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                margin: EdgeInsets.only(bottom: 10.0),
                                child: GestureDetector(
                                  onTap: () => urlLauncher(newsUrl),
                                  child: Text(
                                    newsTitle,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                )),
                            // Container(margin: EdgeInsets.only(top: 10.0, bottom: 10.10),),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              child: Text('\u00a9 ${newsSource.toUpperCase()}'),
                            ),
                            // Container(margin: EdgeInsets.only(top: 10.0, bottom: 10.10),),
                            Container(child: verifyImage(newsImage)),
                            // child: Image.network(newsImage, fit: BoxFit.fill),
                          ],
                        ),
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}

verifyImage(String imgData) {
  if (imgData == null) {
    return Image(image: AssetImage('assets/no-image.png'));
  } else {
    return Image.network(
      imgData,
      fit: BoxFit.fill,
    );
  }
}
