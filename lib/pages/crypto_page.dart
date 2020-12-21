import 'package:flutter/material.dart';
import '../services/web.dart';
import 'dart:convert';

class CryptoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String reqUrl = 'https://api.coincap.io/v2/assets';
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Page'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
            future: HttpRequestHandler().httpGet(reqUrl),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print('Response has data');
                String rawResponse = snapshot.data.body;
                Map parsedResponse = jsonDecode(rawResponse);
                List assetList = parsedResponse['data'];
                return ListView.builder(
                    itemCount: assetList.length,
                    itemBuilder: (context, index) {
                      String assetRank = assetList[index]['rank'];
                      String assetSymbol = assetList[index]['symbol'];
                      String assetPrice = assetList[index]['priceUsd'];
                      return Card(
                        margin: EdgeInsets.all(10.0),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(assetRank, style: TextStyle(fontWeight: FontWeight.bold),)),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(assetSymbol, style: TextStyle(fontWeight: FontWeight.bold))),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: Text(formatPrice(assetPrice), style: TextStyle(fontWeight: FontWeight.bold))),
                          ],
                        ),
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}

formatPrice(String amount) {
  double toDouble = double.parse(amount);
  String amountToTwoDecimals = toDouble.toStringAsFixed(2) + ' USD';
  return amountToTwoDecimals;
}
