import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'res/colori.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  Colori _c = new Colori();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.decelerate,
        animationDuration: Duration(milliseconds: 500),
        key: _bottomNavigationKey,
        index: 1,
        color: Colors.white,
        backgroundColor: _c.getStartGradient(),
        items: <Widget>[
          Icon(Icons.list, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
                      _c.getStartGradient(),
                      _c.getEndGradient(),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    tileMode: TileMode.clamp
          )
        ),
      ),
    );
  }
}
