import 'package:flutter/material.dart';

class OtherPage extends StatefulWidget {
  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        bottom: 20.0
      ),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(
          Radius.circular(15.0)
        )
      ),
      child: Center(
        child: Text('Page not found'),
      ),
    );
  }
}