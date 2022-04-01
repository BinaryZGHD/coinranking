
import 'package:flutter/material.dart';



class Item_Coin extends StatelessWidget {
  Item_Coin({ Key? key, required this.data, this.onTap}) : super(key: key);
  final data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(3),
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Card(
            child: Row(
              children: [
                Container(
                    height: 20,
                    width: 15,
                ),
                Container(
                  height: 20,
                  width: 20,
                  child: Text(data["rank"].toString(), style: TextStyle(fontSize: 12, color: Color(0xFF8A8989)),)
                ),
                Container(
                  height: 50,
                  width: 50,
                  // child: Image.asset('assets/Tom.png', width: 100.0, height: 100.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(data['iconUrl']),
                      // AssetImage("assets/logo/btc.jpg"),

                      // image: NetworkImage(food.urlImage),
                    ),
                  ),
                ),
                  Container(
                    height: 10,
                    width: 10,
                  ),
                  Container(
                    height: 60,
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        data['symbol'],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                        Text(
                          data['name'],
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                      ],
                    ),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 5,),
                    SizedBox(height: 5,),
                    Text('price : ' + data["price"], style: TextStyle(fontSize: 10, color: Color(0xFF333333)),),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Icon(Icons.schedule_rounded, color: Color(0xFF8A8989), size: 14,),
                        SizedBox(width: 2,),
                        Text('24h :'+ data["24hVolume"], style: TextStyle(fontSize: 12, color: Color(0xFF8A8989)),),
                        SizedBox(width: 20,),
                        // Icon(Icons.star, color: Color(0xFFf5ba92), size: 14,),
                        // SizedBox(width: 2,),
                        // Text(data["rank"].toString(), style: TextStyle(fontSize: 12, color: Color(0xFF8A8989)),)
                      ],
                    )
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}