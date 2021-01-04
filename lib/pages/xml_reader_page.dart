import 'package:flutter/material.dart';
import 'styles.dart';
import '../services/web.dart';
import 'package:webfeed/webfeed.dart';
// import 'package:xml/xml.dart';

class XmlReaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String reqUrl = 'https://www.spiegel.de/schlagzeilen/tops/index.rss';
    return Scaffold(
      appBar: AppBar(
        title: Text('XML/RSS Reader'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: HttpRequestHandler().httpGet(reqUrl),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var rawData = snapshot.data.body;
            var parsedData = RssFeed.parse(rawData);
            var newsItems = parsedData.items;
            // RssItem item = parsedData.items.first;
            return ListView.builder(
                itemCount: newsItems.length,
                itemBuilder: (context, index) {
                  String newsTitle = newsItems[index].title;
                  String newsImage = newsItems[index].enclosure.url;
                  String newsUrl = newsItems[index].link;
                  return Card(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5.0, top: 5.0),
                          child: GestureDetector(
                              onTap: () => urlLauncher(newsUrl),
                              child: Text(
                                newsTitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              )),
                        ),
                        Container(
                          child: verifyImage(newsImage),
                          margin: EdgeInsets.only(bottom: 10.0),
                        ),
                        /* Container(
                          margin: EdgeInsets.only(bottom: 5.0),
                          child: Text('\u00a9 DER SPIEGEL'),
                        ), */
                      ],
                    ),
                  );
                });
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Request returned error!',
                style: MyTextStyle,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
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
