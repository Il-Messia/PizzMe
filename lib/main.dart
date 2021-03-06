/*-------------------------------------------------------------------------------
  Created by Alex De Leo
  GitHub: https://github.com/Il-Messia
  Description: Simple app created through the Flutter framework. It allows the 
               ordering of pizzas for takeaway by message or call.
 ------------------------------------------------------------------------------*/
 /*-------------------------------------------------------------------------------
 main.dart
  -spashScreen
  -init function
  ------------------------------------------------------------------------------*/

import 'dart:async';
import 'dart:math';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:pizzme/pages/pages.dart';
import 'package:pizzme/pages/permissionPage.dart';
import 'package:pizzme/res/values.dart';
import 'package:flutter/services.dart';
import 'package:pizzme/util/permissionManager.dart';
import 'package:pizzme/util/sharedManager.dart';
import 'package:pizzme/util/userManager.dart';
import 'res/colori.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Colori.darkTheme = await SharedManager.getThemeFromShared();
  runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.white, accentColor: Colors.pinkAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Values values = new Values();

  Future<bool> checkConnection() async {

    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      Fluttertoast.showToast(
          msg: "Rete non connessa, connetti il tuo cellulare!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colori.darkTheme
              ? Colori.darkThemePrimaryColorDark
              : Colori.lightThemePrimaryColorLight,
          textColor: Colori.darkTheme ? Colors.white : Colors.black,
          fontSize: 16.0);
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    
    PermissionManager.init();
    
    UserData.init();
    
    this.checkConnection();

    Random random = new Random();

    Timer(Duration(milliseconds: random.nextInt(values.getSplashTime())), () {
      if (PermissionManager.getAllPermissionStatus()) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Pages()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => PermissionPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colori.darkTheme
          ? Colori.darkThemePrimaryColorDark
          : Colori.lightThemePrimaryColorLight,
      systemNavigationBarIconBrightness:
          Colori.darkTheme ? Brightness.light : Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          Colori.darkTheme ? Brightness.light : Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colori.darkTheme
                    ? Colori.darkThemePrimaryColorDark
                    : Colori.lightThemePrimaryColorDark),
            child: Container(
              margin: new EdgeInsets.only(
                  top: values.getAndroidStatusBarHeigth(),
                  bottom: values.getSplashMargin(),
                  right: values.getSplashMargin(),
                  left: values.getSplashMargin()),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colori.startGradient,
                        Colori.endGradient,
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
                    color: Colori.darkTheme
                        ? Colori.darkThemePrimaryColorDark
                        : Colori.lightThemePrimaryColorDark,
                    borderRadius: BorderRadius.all(
                        Radius.circular(values.getInternalSplashRadius()))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GradientText(
                      'PizzMe',
                      gradient: LinearGradient(
                        colors: [Colori.startGradient, Colori.endGradient],
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
