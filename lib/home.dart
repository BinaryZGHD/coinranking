


import 'package:flutter/material.dart';

import 'dataapi.dart';
import 'getcoinapi.dart';
import 'itemcoin.dart';



class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void onTabTapped(int index) {
    setState(() {
      _counter = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            snap: true,
            floating: true,
            title: getAppBar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => buildBody(),
              childCount: 1,
            ),
          ),

        ],

      )



    );
  }

  Widget getAppBar(){
    return
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('test coins API CoinRanking', style: TextStyle(color: Color(0xFF8A8989), fontSize: 14,),),
                  SizedBox(height: 5,),
                  Text("Good Morning!", style: TextStyle(color: Color(0xFF333333), fontWeight: FontWeight.w500, fontSize: 18,)),
                ],
              )
            ),

              TextButton(

                onPressed: () {},
                child:  const Text('Login'),
              ),
              TextButton(

                onPressed: () {},
                child: Container(
                  height: 50,
                  width: 50,
                  // child: Image.asset('assets/Tom.png', width: 100.0, height: 100.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:  AssetImage("assets/logo/profile.png"),

                      // image: NetworkImage(food.urlImage),
                    ),
                  ),
                ),
              )

          ],
        ),
      );
  }

  buildBody(){
    return
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("CRYPTOCURRENCY", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFF333333)),),
                      Text("PRICE", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFF333333)),),
                      Text("MARKET CAP", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFF333333)),),
                      Text("24 H", style: TextStyle(fontSize: 10, color: Color(0xFF3E4249) ),),
                    ],
                  ),
                ),
                getFeature(),

              ]
          ),
        ),

      );

  }

  int selectedCollection = 0;
  getFeature(){
    return
      SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
        scrollDirection: Axis.horizontal,
        child: Column(
            children: List.generate(Data_Api.length, (index) =>
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Item_Coin(
                      // FoodMenu food = menu[index],
                      data: Data_Api[index],
                      onTap: (){
                      },
                    )
                )
            )
        ),
      );
  }
  //
  // getButtonBar() {
  //   BottomNavigationBar(
  //     currentIndex: _counter,
  //     onTap: onTabTapped,
  //     unselectedItemColor: Colors.blueGrey,
  //     showUnselectedLabels: true,
  //     fixedColor: Colors.black87,
  //     items: const [
  //       BottomNavigationBarItem(
  //         icon: Icon(
  //           Icons.home,
  //           color: Colors.black,
  //         ),
  //         label: 'Home',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(
  //           Icons.shopping_cart,
  //           color: Colors.black,
  //         ),
  //         label: 'Cart',
  //       ),
  //
  //       BottomNavigationBarItem(
  //         icon: Icon(
  //           Icons.camera_alt,
  //           color: Colors.black,
  //         ),
  //         label: 'Camera',
  //       ),BottomNavigationBarItem(
  //         icon: Icon(
  //           Icons.favorite,
  //           color: Colors.black,
  //         ),
  //         label: 'Favorite',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(
  //           Icons.settings,
  //           color: Colors.black,
  //         ),
  //         label: 'Settings',
  //       ),
  //     ],
  //   );
  // }
  }

