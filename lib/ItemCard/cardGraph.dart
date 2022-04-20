
import 'package:coinranking/GetApiCoinRanking/getcoinapi.dart';
import 'package:coinranking/GetApiCoinRanking/svgtopng.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';



class Card_Gragh extends StatelessWidget {
  const Card_Gragh ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card_Gragh_Ful();
  }
}

class Card_Gragh_Ful extends StatefulWidget {
  const Card_Gragh_Ful({Key? key}) : super(key: key);

  @override
  State<Card_Gragh_Ful> createState() => _Card_Gragh_Ful_State();
}

class _Card_Gragh_Ful_State extends State<Card_Gragh_Ful> {
  // final RegExp exp = new RegExp(".svg");
  // int _counter = 0;
  // void onTabTapped(int index) {
  //   setState(() {
  //     _counter = index;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    getAPICoinsGragh();
  }

  //GetCoinApi getCoinApiFromJson
  //GetToCoin getToCoinFromJson
  GetToCoin? _dataFromAPIGragh;
  // late GetCoinApi _dataFromAPI;

  Future<GetToCoin?> getAPICoinsGragh() async {
    // var url = Uri.parse("https://api.coinranking.com/v2/coins");
    // // var response = await http.get(Uri.parse(url) , headers: {
    // //   "X-CoinAPI-Key": "coinrankingb02706b487db6a961a091c243825d4fe4cd9907b6221a4a8"
    // // }
    // var response = await http.get(url, headers: <String, String>{
    //   "x-access-token":
    //       "coinrankingb02706b487db6a961a091c243825d4fe4cd9907b6221a4a8"
    // });
    // print(response.body);
    // print(response.statusCode);
    // _dataFromAPI =
    //     getToCoinFromJson(response.body); // get the data from the api

    // print("เรียกใช้ Get_Coin_price");
    var url = Uri.parse("https://api.coinranking.com/v2/coins?");
    var response = await http.get(url, headers: <String, String>{
      'x-access-token':
      // 'coinrankinga098ff1270353e56c70cd5c7ab350b42627418b2ad36929c'
      'coinrankingb02706b487db6a961a091c243825d4fe4cd9907b6221a4a8'
    });


    _dataFromAPIGragh = getToCoinFromJson(response.body);
    return _dataFromAPIGragh;

    // if (response.statusCode == 200) {
    //   _dataFromAPI = getToCoinFromJson(response.body);
    //   return  _dataFromAPI = getToCoinFromJson(response.body) ;
    //   // _dataFromAPI =GetToCoin.fromJson(jsonDecode(response.body));
    //   // return GetToCoin.fromJson(jsonDecode(response.body));
    // } else {
    //
    //   throw Exception('Failed to load CoinModel');
    // }

    //
    // log(response.body);
    // print(response.body);
    //
    // _dataFromAPI =(response.body) as CoinModel?; // get the data from the api
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(
        future: getAPICoinsGragh(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var result = snapshot.data;
            return ListView.builder(
                itemCount: _dataFromAPIGragh?.data?.coins?.length ?? 0,
                // itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      // LinearProgressIndicator(),
                      Card(
                        margin: const EdgeInsets.all(3),
                        elevation: 1,
                        child: InkWell(
                          // leading: Image.asset(food.img, width: 200.0, height: 200.0),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${index + 1}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 10),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: SvgToPng(
                                  svgto:
                                  result.data.coins[index].iconUrl,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  //Initialize the spark charts widget
                                  child: SfSparkAreaChart.custom(
                                    //Enable the trackball
                                    trackball: SparkChartTrackball(
                                        activationMode: SparkChartActivationMode.tap),
                                    color: Colors.deepPurpleAccent,
                                    //Enable marker
                                    // marker: SparkChartMarker(
                                    //     displayMode: SparkChartMarkerDisplayMode.all),
                                    //Enable data label
                                    // labelDisplayMode: SparkChartLabelDisplayMode.all,
                                    xValueMapper: (int index2) => index2 ,
                                    yValueMapper: (int index2) => double.parse( result.data.coins[index].sparkline[index2]) ,
                                    dataCount: result.data.coins[index].sparkline.length,
                                  ),
                                ),
                              ),


                                // Text(
                                //     '${NumberFormat("#,###.######").format(double.parse("${_dataFromAPI?.data?.coins?.elementAt(index)?.price} "))} USD',
                                //     style: TextStyle(
                                //         fontSize: 10,
                                //         fontWeight: FontWeight.bold,

                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                });
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}
