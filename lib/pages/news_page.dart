import 'package:flutter/material.dart';
// import 'styles.dart';
import '../services/web.dart';
import 'dart:convert';
// import '../assets/';

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
                print('This endpoint has data!');
                var rawData = snapshot.data.body;
                var parsedData = jsonDecode(rawData);
                List newsList = parsedData['articles'];
                return ListView.builder(
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      var newsSource = newsList[index]['source']['name'];
                      var newsTitle = newsList[index]['title'];
                      // var newsAuthor = newsList[index]['author'];
                      var newsImage = newsList[index]['urlToImage'];
                      return Card(
                        margin: EdgeInsets.all(10),
                        elevation: 5.0,
                        shape: CircleBorder(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Text(newsTitle),
                            ),
                            Container(
                              child: Text('\u00a9 ${newsSource.toUpperCase()}'),
                            ),
                            Container(
                              child: Image.network(
                                verifyImage(newsImage),
                                fit: BoxFit.fill,
                              ),
                              // child: Image.network(newsImage),
                            )
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
  // print(imgData.runtimeType);
  if (imgData == null) {
    return 'No image available';
  } else {
    return imgData;
  }
}