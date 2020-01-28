import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizzme/res/colori.dart';
import 'package:pizzme/res/values.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Values values = new Values();

  String _name = "Name";

  int _ordinazioni = 0;
  @override
  void initState() {
    super.initState();
  }

  Future<void> setDefaultTheme() async {
    final shared = await SharedPreferences.getInstance();
    await shared.setBool(values.getKeyTheme(), false);
    setState(() {
      Colori.darkTheme = false;
    });
  }

  Future<void> setDarkTheme() async {
    final shared = await SharedPreferences.getInstance();
    await shared.setBool(values.getKeyTheme(), true);
    setState(() {
      Colori.darkTheme = true;
    });
  }

  void _showAlert() {
    var alertStyle = AlertStyle(
        backgroundColor: Colori.darkTheme
            ? Colori.darkThemePrimaryColorDark
            : Colori.lightThemePrimaryColorLight,
        animationType: AnimationType.fromBottom,
        alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(
                color: Colori.darkTheme
                    ? Colori.darkThemePrimaryColorDark
                    : Colori.lightThemePrimaryColorLight)),
        titleStyle:
            TextStyle(color: Colori.darkTheme ? Colors.white : Colors.black),
        descStyle:
            TextStyle(color: Colori.darkTheme ? Colors.white : Colors.black));
    Alert(
      context: context,
      type: AlertType.warning,
      title: "ATTENZIONE",
      style: alertStyle,
      desc:
          "E' consigliato riavviare l'app o cambiare schermata per godere al massimo il tema!",
      buttons: [
        DialogButton(
          child: Text(
            "Okay",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(
              colors: [Colori.startGradient, Colori.endGradient]),
          width: 120,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colori.darkTheme
          ? Colori.darkThemePrimaryColorDark
          : Colori.lightThemePrimaryColorLight,
      systemNavigationBarIconBrightness:
          Colori.darkTheme ? Brightness.light : Brightness.dark,
      statusBarIconBrightness:
          Colori.darkTheme ? Brightness.light : Brightness.dark,
    ));
    return Container(
      margin: new EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
      decoration: new BoxDecoration(
          color: Colori.darkTheme
              ? Colori.darkThemePrimaryColorMedium
              : Colori.lightThemePrimaryColorDark,
          borderRadius: new BorderRadius.all(Radius.circular(15.0)),
          boxShadow: [
            new BoxShadow(
                color: Colors.black38,
                blurRadius: 5.0,
                spreadRadius: 5.0,
                offset: Offset(5.0, 5.0))
          ]),
      child: Center(
        child: Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: new EdgeInsets.only(
                  top: 5.0, left: 5.0, right: 5.0, bottom: 5.0),
              color: Colori.darkTheme
                  ? Colori.darkThemePrimaryColorLight
                  : Colori.lightThemePrimaryColorLight,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          margin: new EdgeInsets.all(30.0),
                          child: CircleAvatar(
                            radius: values.getAvatarRadius(),
                            backgroundImage:
                                AssetImage('images/def_avatar.png'),
                          ))
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: new EdgeInsets.only(left: 30.0),
                        child: Center(
                          child: Text(
                            _name,
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                              fontSize: 35.0,
                              color: Colori.darkTheme
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colori.darkTheme
                  ? Colori.darkThemePrimaryColorLight
                  : Colori.lightThemePrimaryColorLight,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          margin: new EdgeInsets.only(
                              top: 10.0, left: 20.0, bottom: 10.0),
                          child: Icon(
                            Icons.fastfood,
                            color: Colori.darkTheme
                                ? Colors.white
                                : Colors.black,
                            size: 30.0,
                          )),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: new EdgeInsets.only(
                            top: 10.0, left: 20.0, bottom: 10.0),
                        child: Text(
                          'Ordinazioni effettuate: $_ordinazioni',
                          style: new TextStyle(
                            fontSize: 20.0,
                            color:
                                Colori.darkTheme ? Colors.white : Colors.black,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colori.darkTheme
                  ? Colori.darkThemePrimaryColorLight
                  : Colori.lightThemePrimaryColorLight,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          margin: new EdgeInsets.only(
                              top: 10.0, left: 20.0, bottom: 10.0),
                          child: Icon(
                            Icons.chrome_reader_mode,
                            color: Colori.darkTheme
                                ? Colors.white
                                : Colors.black,
                            size: 30.0,
                          )),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: new EdgeInsets.only(
                            top: 10.0, left: 20.0, bottom: 10.0),
                        child: Text(
                          'Tema scuro',
                          style: new TextStyle(
                            fontSize: 20.0,
                            color:
                                Colori.darkTheme ? Colors.white : Colors.black,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          margin: new EdgeInsets.only(left: 20.0),
                          child: Switch(
                            value: Colori.darkTheme,
                            onChanged: (value) {
                              if (value) {
                                this.setDarkTheme();
                                this._showAlert();
                              } else {
                                this.setDefaultTheme();
                                this._showAlert();
                              }
                            },
                            activeTrackColor: Colori.startGradient,
                            activeColor: Colori.endGradient,
                          )),
                    ],
                  )
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colori.darkTheme
                  ? Colori.darkThemePrimaryColorLight
                  : Colori.lightThemePrimaryColorLight,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          margin: new EdgeInsets.only(
                              top: 10.0, left: 20.0, bottom: 10.0),
                          child: Icon(
                            Icons.code,
                            color: Colori.darkTheme
                                ? Colors.white
                                : Colors.black,
                            size: 30.0,
                          )),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: new EdgeInsets.only(
                            top: 10.0, left: 20.0, bottom: 10.0),
                        child: Center(
                            child: SizedBox(
                          width: 300.0,
                          child: GestureDetector(
                            onTap: () {
                              _launchURL(values.codeUrl);
                            },
                            child: Text(
                              'Visualizza codice sorgente',
                              style: new TextStyle(
                                  color: Colori.darkTheme
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'Roboto'),
                            ),
                          ),
                        )),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colori.darkTheme
                  ? Colori.darkThemePrimaryColorLight
                  : Colori.lightThemePrimaryColorLight,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          margin: new EdgeInsets.only(
                              top: 10.0, left: 20.0, bottom: 10.0),
                          child: Icon(
                            Icons.account_box,
                            color: Colori.darkTheme
                                ? Colors.white
                                : Colors.black,
                            size: 30.0,
                          )),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: new EdgeInsets.only(
                            top: 10.0, left: 20.0, bottom: 10.0),
                        child: Center(
                            child: SizedBox(
                          width: 300.0,
                          child: GestureDetector(
                            onTap: () {
                              _launchURL(values.developerUrl);
                            },
                            child: Text(
                              'Sviluppatore',
                              style: new TextStyle(
                                  color: Colori.darkTheme
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'Roboto'),
                            ),
                          ),
                        )),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      print("Opening url");
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
