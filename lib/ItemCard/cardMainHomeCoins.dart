import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../GetApiCoinRanking/svgtopng.dart';

class card_Main_Home_Coins extends StatelessWidget {
  final int index;
  final String symbol;
  final String name;
  final String price;
  final String iconUrl;



  const card_Main_Home_Coins({Key? key, required this.index, required this.symbol, required this.name, required this.price, required this.iconUrl, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return card_Main_Home_Coins_STF(
      index :index, symbol: symbol, name: name, price: price, iconUrl: iconUrl,);

  }
}
class card_Main_Home_Coins_STF extends StatefulWidget {
  final int index;
  final String symbol;
  final String name;
  final String price;
  final String iconUrl;
  const card_Main_Home_Coins_STF({Key? key, required this.index, required this.symbol, required this.name, required this.price, required this.iconUrl}) : super(key: key);

  @override
  State<card_Main_Home_Coins_STF> createState() => _card_Main_Home_Coins_STFState();
}

class _card_Main_Home_Coins_STFState extends State<card_Main_Home_Coins_STF> {
  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.all(3),
      elevation: 1,
      child: InkWell(
        // leading: Image.asset(food.img, width: 200.0, height: 200.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.index.toString(),
                style: const TextStyle(
                    color: Colors.black, fontSize: 10),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              child: SvgToPng(
                svgto: widget.iconUrl,
              ),
            ),
            Column(
              children: [
                Container(
                  height: 15,
                  width: 100,
                  // margin: const EdgeInsets.symmetric(vertical: 10.0),
                  // alignment: const Alignment(0.0, 0.0),
                  child: Text(
                      widget.name,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Container(
                  height: 15,
                  width: 100,
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0),
                  // alignment: const Alignment(0.0, 0.0),
                  child: Text(
                      widget.symbol,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              ],
            ),
            Container(
              height: 15,
              width: 100,
              margin:
              const EdgeInsets.symmetric(vertical: 5.0),
              // alignment: const Alignment,

              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                    '${NumberFormat("#,###.######").format(double.parse( widget.price ))} USD',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              // Text(
              //     '${NumberFormat("#,###.######").format(double.parse("${_dataFromAPI?.data?.coins?.elementAt(index)?.price} "))} USD',
              //     style: TextStyle(
              //         fontSize: 10,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
