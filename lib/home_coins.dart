
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'GetApiCoinRanking/getapiapply.dart';
import 'GetApiCoinRanking/getcoinapi.dart';

import 'GetApiCoinRanking/svgtopng.dart';
import 'ItemCard/cardMainHomeCoins.dart';


class Home_Coins extends StatelessWidget {
  const Home_Coins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Home_Coins_Ful();
  }
}

class Home_Coins_Ful extends StatefulWidget {
  const Home_Coins_Ful({Key? key}) : super(key: key);

  @override
  State<Home_Coins_Ful> createState() => _Home_Coins_Ful_State();
}

class _Home_Coins_Ful_State extends State<Home_Coins_Ful> {
  // final RegExp exp = new RegExp(".svg");
  // int _counter = 0;
  // void onTabTapped(int index) {
  //   setState(() {
  //     _counter = index;
  //   });
  // }
  GetToCoin? _dataFromAPI;
  // @override
  // void initState() {
  //   super.initState();
  //   getAPICoins();
  // }
  //

  //
  //
  // Future<GetToCoin?> getAPICoins() async {
  //   // print("เรียกใช้ Get_Coin_price");
  //   var url = Uri.parse("https://api.coinranking.com/v2/coins?");
  //   var response = await http.get(url, headers: <String, String>{
  //     'x-access-token': 'coinrankingb02706b487db6a961a091c243825d4fe4cd9907b6221a4a8'
  //   });
  //
  //   _dataFromAPI = getToCoinFromJson(response.body);// get the data from the api
  //   return _dataFromAPI;
  //
  //   // log(response.body);
  //   // print(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        // Text(widget.changeTitle),
        const Text("API CoinRanking Coins"),
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: getAPICoins(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var result = snapshot.data;
            return ListView.builder(
                itemCount: _dataFromAPI?.data?.coins?.length ?? 0,
                // itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                 return card_Main_Home_Coins(
                   index: index + 1,
                   name: result.data.coins[index].name,
                   symbol: result.data.coins[index].symbol,
                   iconUrl: result.data.coins[index].iconUrl,
                   price: result.data.coins[index].price );
                });
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}
