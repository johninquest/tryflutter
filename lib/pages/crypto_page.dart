import 'package:flutter/material.dart';
import './styles.dart';
import '../services/web.dart';
import 'dart:convert';

class CryptoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String reqUrl = 'https://api.coincap.io/v2/assets';
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Crypto Page'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
              margin: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text('Name', style: CDTextStyle),
                  Text('Price', style: CDTextStyle),
                  Text(
                    '24h',
                    style: CDTextStyle,
                  )
                ],
              )),
          FutureBuilder(
              future: HttpRequestHandler().httpGet(reqUrl),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // print('Response has data');
                  String rawResponse = snapshot.data.body;
                  Map parsedResponse = jsonDecode(rawResponse);
                  List assetList = parsedResponse['data'];
                  return ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: assetList.length,
                      itemBuilder: (context, index) {
                        String assetRank = assetList[index]['rank'];
                        String assetSymbol = assetList[index]['symbol'];
                        String assetName = assetList[index]['name'];
                        String assetPrice = assetList[index]['priceUsd'];
                        String asset24hChange =
                            assetList[index]['changePercent24Hr'];
                        return Card(
                          margin: EdgeInsets.all(5.0),
                          color: Colors.grey[900],
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  // alignment: Alignment.bottomCenter,
                                  child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        assetRank,
                                        style: MyApiDataStyle,
                                      ),
                                      Text('')
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        assetSymbol,
                                        style: MyApiDataStyle,
                                      ),
                                      Text(
                                        assetName,
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                              Container(
                                  // alignment: Alignment.bottomRight,
                                  child: Text(formatPrice(assetPrice),
                                      style: MyApiDataStyle)),
                              Container(
                                  // alignment: Alignment.bottomRight,
                                  child: Text(formatValueChange(asset24hChange),
                                      style:
                                          stylePercentChange(asset24hChange))),
                            ],
                          ),
                        );
                      });
                } else {
                  return LinearProgressIndicator();
                }
              })
        ],
      ),
    );
  }
}

formatPrice(String amount) {
  double toDouble = double.parse(amount);
  String amountToTwoDecimals = toDouble.toStringAsFixed(2);
  return '\$$amountToTwoDecimals';
}

formatValueChange(String changeValue) {
  double toDouble = double.parse(changeValue);
  String amountToTwoDecimals = toDouble.toStringAsFixed(2) + '%';
  return amountToTwoDecimals;
}

stylePercentChange(String percentValue) {
  double toDouble = double.parse(percentValue);
  if (toDouble < 0) {
    var negStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.red);
    return negStyle;
  }
  if (toDouble >= 0) {
    var posStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.green);
    return posStyle;
  }
}
