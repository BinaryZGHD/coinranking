
import 'package:coinranking/GetApiCoinRanking/getcoinapi.dart';
import 'package:coinranking/GetApiCoinRanking/svgtopng.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';



class Box_Gragh extends StatelessWidget {
  final String index;
  const Box_Gragh ({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Box_Gragh_Ful(
      indexGragh: index,
    );
  }
}

class Box_Gragh_Ful extends StatefulWidget {
  final String indexGragh;
  const Box_Gragh_Ful({Key? key, required this.indexGragh}) : super(key: key);

  @override
  State<Box_Gragh_Ful> createState() => _Box_Gragh_Ful_State();
}

class _Box_Gragh_Ful_State extends State<Box_Gragh_Ful> {
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
            return Card(
              margin: const EdgeInsets.all(3),
              elevation: 1,
              child: InkWell(
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    //Initialize the spark charts widget
                    child: SfSparkAreaChart.custom(
                      //Enable the trackball
                      trackball: SparkChartTrackball(
                          activationMode: SparkChartActivationMode.tap),
                      color: Colors.deepPurpleAccent,
                      xValueMapper: (int index2) => index2 ,
                      yValueMapper: (int index2) => double.parse( result.data.coins[ int.parse( widget.indexGragh )].sparkline[index2]) ,
                      dataCount: result.data.coins[int.parse( widget.indexGragh )].sparkline.length,


                    ),
                  ),
                ),

              ),
            );
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}
