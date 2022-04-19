import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SvgToPng extends StatelessWidget {
  final String svgto ;
  const SvgToPng({Key? key, required this.svgto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SvgToPngF(
      svgto: svgto,
    );

  }
}
class _SvgToPngF extends StatefulWidget {
  const _SvgToPngF({Key? key, required this.svgto, }) : super(key: key);
  final String svgto ;
  @override
  State<_SvgToPngF> createState() => _SvgToPngFState();
}

class _SvgToPngFState extends State<_SvgToPngF> {
  @override
  Widget build(BuildContext context) {

    RegExp exp = RegExp(r'.svg' , caseSensitive: false);
    String str = "${widget.svgto}";
    Iterable<RegExpMatch> matches = exp.allMatches(str);


    if(exp.hasMatch(str)){
      return Container(
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child:  SvgPicture.network("${widget.svgto}",
            width: 50,
            height: 50,
          ),
        ),
      );
    }else{
      // return Container(
      //       height: 40,
      //       width: 40,
      //       // child: Image.asset('assets/Tom.png', width: 100.0, height: 100.0),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(100),
      //         image: DecorationImage(
      //           fit: BoxFit.cover,
      //
      //
      //           // image: SvgPicture.network('${_dataFromAPI?.data?.coins?.elementAt(index)?.iconUrl}' ,
      //           //   width: 50,
      //           //   height: 50,
      //           // ),
      //           image: NetworkImage("${widget.svgto}"),
      //           // _dataFromAPI.data.coins[index].iconUrl),
      //           // image: AssetImage("assets/logo/btc.jpg"),
      //
      //
      //         ),
      //       ),
      //     );
      return Container(
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child:  Image.network("${widget.svgto}",
            width: 50,
            height: 50,
          ),
        ),
      );

    }


  }
}
