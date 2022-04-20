import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../GetApiCoinRanking/svgtopng.dart';
import 'boxGraph.dart';

class card_Main_Home_Coins_STF_Detail extends StatelessWidget {

  final int index;
  final String symbol;
  final String name;
  final String price;

  final String iconUrl;
  final String data_Count;

  final String data_sparkline;
  const card_Main_Home_Coins_STF_Detail({Key? key, required this.index, required this.symbol, required this.name,
    required this.price, required this.iconUrl, required this.data_Count, required this.data_sparkline}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return card_Main_Home_Coins_STF_Detail_STF(
        index :index, symbol: symbol, name: name, price: price, iconUrl: iconUrl, data_Count: data_Count, data_sparkline: data_sparkline
    );
  }
}
class card_Main_Home_Coins_STF_Detail_STF extends StatefulWidget {
  final int index;
final String symbol;
final String name;
final String price;
final String iconUrl;
final String data_Count;
final String data_sparkline;
  const card_Main_Home_Coins_STF_Detail_STF({Key? key, required this.index, required this.symbol, required this.name,
    required this.price, required this.iconUrl, required this.data_Count, required this.data_sparkline}) : super(key: key);

  @override
  State<card_Main_Home_Coins_STF_Detail_STF> createState() => _card_Main_Home_Coins_STF_Detail_STFState();
}

class _card_Main_Home_Coins_STF_Detail_STFState extends State<card_Main_Home_Coins_STF_Detail_STF> {
  // List categories = widget.data_sparkline.split(",");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        // Text(widget.changeTitle),
        const Text("API CoinRanking Coins"),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width *1,
            child: Card(
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 20,
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: SvgToPng(
                      svgto: widget.iconUrl,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(widget.name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold , color: Colors.blue[900] ),  ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(widget.symbol, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 5,
                      ),
                      Text( '${NumberFormat("#,###.######").format(double.parse( widget.price ))} USD' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 10,
            child: Container(
              height: 150,
              width: 600,
              child: Box_Gragh(
                index: widget.index.toString(),
              ),
            ),
          ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width *1,
              height: 150,
              ),
            ),

        ],
      ),
    )
    );

  }
}
