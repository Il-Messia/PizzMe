import 'package:flutter/material.dart';
import 'package:pizzme/res/values.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Values values = new Values();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(
        top: values.getAndroidStatusBarHeigth(),
        left: 15.0,
        right: 15.0,
        bottom: 20.0
      ),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(
          Radius.circular(15.0)
        ),
        boxShadow: [
          new BoxShadow(
            color: Colors.black38,
            blurRadius: 5.0,
            spreadRadius: 5.0,
            offset: Offset(
              0.0,
              5.0
            )
          )
        ]
      ),
      child: Center(
        child: Text('HomePage'),
      ),
    );
  }
}