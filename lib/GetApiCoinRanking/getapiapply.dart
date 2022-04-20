import 'package:http/http.dart' as http;
import 'getcoinapi.dart';

GetToCoin? _dataFromAPI;
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
  return _dataFromAPI;

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