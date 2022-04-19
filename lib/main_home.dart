import 'dart:convert';
import 'dart:developer';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'GetApiCoinRanking/getcoinapi.dart';
import 'GetApiCoinRanking/svgtopng.dart';



class Main_Home extends StatelessWidget {
  const Main_Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Main_Home_Ful();
  }
}

class Main_Home_Ful extends StatefulWidget {
  const Main_Home_Ful({Key? key}) : super(key: key);

  @override
  State<Main_Home_Ful> createState() => _Main_Home_Ful_State();
}

class _Main_Home_Ful_State extends State<Main_Home_Ful> {
  // final RegExp exp = new RegExp(".svg");
  // int _counter = 0;
  // void onTabTapped(int index) {
  //   setState(() {
  //     _counter = index;
  //   });
  // }
  final String dogUrl = "https://www.svgrepo.com/show/2046/dog.svg";

  @override
  void initState() {
    super.initState();
    getAPICoins();
  }


  //GetCoinApi getCoinApiFromJson
  //GetToCoin getToCoinFromJson
  GetToCoin? _dataFromAPI;
  // late GetCoinApi _dataFromAPI;

  Future<GetToCoin?> getAPICoins() async {
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


    print("เรียกใช้ Get_Coin_price");
    var url = Uri.parse("https://api.coinranking.com/v2/coins?");
    var response = await http.get(url, headers: <String, String>{
      'x-access-token':
      'coinrankinga098ff1270353e56c70cd5c7ab350b42627418b2ad36929c'
    });

    _dataFromAPI = getToCoinFromJson(response.body);
    return  _dataFromAPI;

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
      appBar: AppBar(
        title:
        // Text(widget.changeTitle),
        const Text("API CoinRanking 2 "),
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: getAPICoins(),
        builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            var result = snapshot.data;
            return ListView.builder(
                itemCount: _dataFromAPI?.data?.coins?.length ?? 0,
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

                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child:  SvgPicture.network("${_dataFromAPI?.data?.coins?.elementAt(index)?.iconUrl}",
                              //     width: 50,
                              //     height: 50,
                              //   ),
                              // ),
                              // Container(
                              //   height: 40,
                              //   width: 40,
                              //   // child: Image.asset('assets/Tom.png', width: 100.0, height: 100.0),
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(100),
                              //     image: DecorationImage(
                              //       fit: BoxFit.cover,
                              //
                              //
                              //       // image: SvgPicture.network('${_dataFromAPI?.data?.coins?.elementAt(index)?.iconUrl}' ,
                              //       //   width: 50,
                              //       //   height: 50,
                              //       // ),
                              //       image: NetworkImage("${_dataFromAPI?.data?.coins?.elementAt(index)?.iconUrl}"),
                              //       // _dataFromAPI.data.coins[index].iconUrl),
                              //       // image: AssetImage("assets/logo/btc.jpg"),
                              //
                              //
                              //     ),
                              //   ),
                              // ),
                              Container(
                                height: 50,
                                width: 50,
                                  child: SvgToPng(
                                    svgto: "${_dataFromAPI?.data?.coins?.elementAt(index)?.iconUrl}",

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
                                        "${_dataFromAPI?.data?.coins?.elementAt(index)?.name}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ),
                                  Container(
                                    height: 15,
                                    width: 100,
                                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                                    // alignment: const Alignment(0.0, 0.0),
                                    child: Text(
                                        " ${_dataFromAPI?.data?.coins?.elementAt(index)?.symbol} ",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ),
                                ],
                              ),

                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   margin: const EdgeInsets.symmetric(vertical: 10.0),
                              //   alignment: const Alignment(0.0, 0.0),
                              //   child: Text(
                              //       "${_dataFromAPI?.data?.coins?.elementAt(index)?.name}",
                              //       style: TextStyle(
                              //           fontSize: 10,
                              //           fontWeight: FontWeight.bold,
                              //           color: Colors.black)),
                              // ),
                              //
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Text(
                              //     "${_dataFromAPI?.data?.coins?.elementAt(index)?.symbol}",
                              //     style: const TextStyle(
                              //         color: Colors.black, fontSize: 12),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${NumberFormat("#,###.######").format( double.parse("${_dataFromAPI?.data?.coins?.elementAt(index)?.price} ") ) } USD',
                                  // "${_dataFromAPI?.data?.coins?.elementAt(index)?.price}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ),
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
