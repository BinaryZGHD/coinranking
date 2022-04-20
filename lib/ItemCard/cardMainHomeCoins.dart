import 'package:coinranking/ItemCard/boxGraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../GetApiCoinRanking/svgtopng.dart';
import 'cardMainHomeCoinsSTFDetail.dart';

class card_Main_Home_Coins extends StatelessWidget {
  final int index;
  final String symbol;
  final String name;
  final String price;

  final String iconUrl;
  final String data_Count;

  final String data_sparkline;

  const card_Main_Home_Coins({Key? key, required this.index, required this.symbol, required this.name, required this.price, required this.iconUrl, sparkline, dataCount, required this.data_Count, required this.data_sparkline, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return card_Main_Home_Coins_STF(
      index :index, symbol: symbol, name: name, price: price, iconUrl: iconUrl, data_Count: data_Count, data_sparkline: data_sparkline);

  }
}
class card_Main_Home_Coins_STF extends StatefulWidget {
  final int index;
  final String symbol;
  final String name;
  final String price;
  final String iconUrl;
  final String data_Count;
  final String data_sparkline;
  const card_Main_Home_Coins_STF({Key? key, required this.index, required this.symbol, required this.name, required this.price, required this.iconUrl, required this.data_Count, required this.data_sparkline}) : super(key: key);

  @override
  State<card_Main_Home_Coins_STF> createState() => _card_Main_Home_Coins_STFState();
}
log(String data_sparkline) {
  print(data_sparkline);
}
class _card_Main_Home_Coins_STFState extends State<card_Main_Home_Coins_STF> {

  @override
  Widget build(BuildContext context) {
    return  Expanded(

      child: Card(
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
                    width: 90,
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
                height: 50,
                width: 80,
                child: Box_Gragh(
                  index: widget.index.toString(),
                ),
              ),
              // Container(
              //   height:  50,
              //   width: 100,
              //   padding: const EdgeInsets.all(0.0),
              //   //Initialize the spark charts widget
              //   child: SfSparkLineChart.custom(
              //     //Enable the trackball
              //     trackball: SparkChartTrackball(
              //         activationMode: SparkChartActivationMode.tap),
              //     //Enable marker
              //     marker: SparkChartMarker(
              //         displayMode: SparkChartMarkerDisplayMode.all),
              //     //Enable data label
              //     labelDisplayMode: SparkChartLabelDisplayMode.all,
              //     xValueMapper: (int index2) => index2 ,
              //     yValueMapper: (int index2) => double.parse( widget.data_sparkline[index2]) ,
              //     dataCount: widget.data_sparkline.length,
              //   ),
              //
              // ),
              Container(
                height: 15,
                width: 95,
                margin:
                const EdgeInsets.symmetric(vertical: 5.0),
                // alignment: const Alignment,

                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                      '${NumberFormat("#,###.######").format(double.parse( widget.price ))} USD' ,
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    card_Main_Home_Coins_STF_Detail(
                        index:widget.index,
                        name: widget.name,
                        symbol: widget.symbol,
                        iconUrl: widget.iconUrl,
                        price: widget.price ,
                        data_Count: widget.data_Count,
                        data_sparkline:  widget.data_sparkline
                    )
                    ),

            );
          },
        ),
      ),
    );
  }
}


