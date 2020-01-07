import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: Colors.black12,
        items: <Widget>[
          Icon(Icons.list, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      body: Container(color:  Colors.black12),
    );
  }
}
