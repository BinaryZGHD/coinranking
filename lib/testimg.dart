import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class testimg extends StatelessWidget {
  const testimg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return runtestimg();
  }
}
class runtestimg extends StatefulWidget {
  const runtestimg({Key? key}) : super(key: key);

  @override
  State<runtestimg> createState() => _runtestimgState();
}

class _runtestimgState extends State<runtestimg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:  50 ,
      width:  50,
      child: FadeInImage.assetNetwork(


        placeholder: "assets/bitcoin_btc.png",
        image: 'https://cdn.coinranking.com/ryY28nXhW/ada.png',
      ),
    );
  }
}
