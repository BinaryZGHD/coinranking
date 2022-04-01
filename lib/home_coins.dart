
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'getcoinapi.dart';


class Home_Coins extends StatelessWidget {
  const Home_Coins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Home_Coins_Ful();
  }
}

class  Home_Coins_Ful extends StatefulWidget {
  const Home_Coins_Ful({Key? key}) : super(key: key);

  @override
  State<Home_Coins_Ful> createState() => _Home_Coins_Ful_State();

}

class _Home_Coins_Ful_State extends State<Home_Coins_Ful> {

   GetCoinApi? _dataFromAPI;
  // late GetCoinApi _dataFromAPI;

  @override
  void initState() {
    super.initState();
    print('initState');
  }
  Future <void> getCoinsExchange() async {
    var url = "https://api.coinranking.com/v2/coins/";
    var response = await http.get(Uri.parse(url));
    _dataFromAPI = getCoinApiFromJson(response.body); // get the data from the api
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        // Text(widget.changeTitle),
        const Text("API CoinRanking"),

      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        // itemCount: _dataFromAPI?.data?.coins?.length ?? 0,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Column(

              children: [
                LinearProgressIndicator(),
                Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 10,
                  child: InkWell(
                    // leading: Image.asset(food.img, width: 200.0, height: 200.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(color: Colors.black, fontSize: 10),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          // child: Image.asset('assets/Tom.png', width: 100.0, height: 100.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:  AssetImage("assets/logo/btc.jpg"),

                              // image: NetworkImage(food.urlImage),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          alignment: const Alignment(0.0, 0.0),
                          child: Text("Name Coins+ ${_dataFromAPI?.data.coins[index].name}",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),

                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "food.subnfood + ${_dataFromAPI?.data.coins[index].name}",
                            style: const TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

