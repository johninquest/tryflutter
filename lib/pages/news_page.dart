import 'package:flutter/material.dart';
import 'styles.dart';
import '../services/web.dart';
import 'dart:convert';

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
                      var newsAuthor = newsList[index]['author'];
                      return Card(
                        child: Text(newsTitle),
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
