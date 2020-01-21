import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:pizzme/res/values.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/pages.dart';
import 'res/colori.dart';

Colori c = new Colori();

void main() => runApp(new MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.white, accentColor: Colors.pinkAccent),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Values values = new Values();
  
  bool _dark = false;

  Future<bool> _getIntFromShared() async{
    final shared = await SharedPreferences.getInstance();
    final result = shared.getBool(values.getKeyTheme());
    if(result == null){
      print("First time startUp");
      this.setDefaultTheme();
    }else{
      setState(() {
        _dark = result;
      });
      return result;
    }
    return result;
  }

  Future<void> setDefaultTheme() async{
    final shared = await SharedPreferences.getInstance();
    await shared.setBool(values.getKeyTheme(), false);
  }

  @override
  void initState() {
    super.initState();

    this._getIntFromShared();

    Timer(Duration(milliseconds: values.getSplashTime()), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Pages()));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: _dark ? c.getDarkThemePrimaryColorDark():  c.getLightThemePrimaryColorDark(), 
      systemNavigationBarIconBrightness: _dark ? Brightness.light : Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: _dark ? c.getDarkThemePrimaryColorDark():  c.getLightThemePrimaryColorDark()),
            child: Container(
              margin: new EdgeInsets.only(
                  top: values.getAndroidStatusBarHeigth(),
                  bottom: values.getSplashMargin(),
                  right: values.getSplashMargin(),
                  left: values.getSplashMargin()),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        c.getStartGradient(),
                        c.getEndGradient(),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.all(
                      Radius.circular(values.getExternalSplashRadius())),
                  boxShadow: [
                    new BoxShadow(
                        color: Colors.black38,
                        blurRadius: 5.0,
                        spreadRadius: 5.0,
                        offset: Offset(0, 2.5))
                  ]),
              child: Container(
                margin: EdgeInsets.all(values.getSplashWeight()),
                decoration: BoxDecoration(
                    color: _dark ? c.getDarkThemePrimaryColorMedium():  c.getLightThemePrimaryColorDark(),
                    borderRadius: BorderRadius.all(
                        Radius.circular(values.getInternalSplashRadius()))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GradientText(
                      'PizzMe',
                      gradient: LinearGradient(
                        colors: [c.getStartGradient(), c.getEndGradient()],
                      ),
                      style: TextStyle(
                          fontSize: 38.0, fontWeight: FontWeight.bold),
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
