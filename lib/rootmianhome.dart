
import 'package:coinranking/ItemCard/boxGraph.dart';
import 'package:coinranking/testimg.dart';
import 'package:flutter/material.dart';

import 'ItemCard/cardGraph.dart';
import 'home_coins.dart';
import 'itemcoin.dart';
import 'main_home.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _screenList = [
    Home_Coins(),
    Card_Gragh(),
    Main_Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
          // Text(widget.changeTitle),
          const Text("API CoinRanking Coins"),

        ),
      drawer: Drawer( child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'นายสมชาย สมบัติ',
              style: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              '62030340@Admin.com',
              style: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/bitcoin_btc.png'),
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
            ),

          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Box_Gragh(index: '1',))
              );
            },
            child: Container(
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text(
                  'หน้าหลัก',
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => testimg()));
            },
            child: Container(
              child: ListTile(
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                title: Text(
                  'ซื้อ-ขาย',
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),

          Container(
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text(
                'ข้อมูลส่วนตัว',
                style: TextStyle(
                  fontFamily: 'Kanit',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            child: ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text(
                'ตั้งค่า',
                style: TextStyle(
                  fontFamily: 'Kanit',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              title: Text(
                'ออกจากระบบ',
                style: TextStyle(
                  fontFamily: 'Kanit',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),

        ],
      ),
      ),

      body: _screenList[_selectedIndex],
      backgroundColor: Color.fromRGBO(11, 12, 54, 1),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.roofing_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart_rounded ),
            label: ' Graph',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_convenience_store_rounded),
            label: 'Market',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
