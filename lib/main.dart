import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gradient_text/gradient_text.dart';
import 'home.dart';
import 'res/colori.dart';

Colori c = new Colori();

void main() => runApp(new MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.white, accentColor: Colors.pinkAccent),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      )
    );

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 3), (){

      print("Spash screen completed");

      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => Home()
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Container(
              margin: new EdgeInsets.only(
                  top: 75.0, bottom: 25.0, right: 25.0, left: 25.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      c.getStartGradient(),
                      c.getEndGradient(),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              child: Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GradientText(
                      'PizzMe',
                      gradient: LinearGradient(
                        colors: [
                          c.getStartGradient(), 
                          c.getEndGradient()
                        ],
                      ),
                      style: TextStyle(
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.all(40.0),
                    ),
                    CircularProgressIndicator()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
