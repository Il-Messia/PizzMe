/*-------------------------------------------------------------------------------
  Created by Alex De Leo
  GitHub: https://github.com/Il-Messia
  Description: Simple app created through the Flutter framework. It allows the 
               ordering of pizzas for takeaway by message or call.
 ------------------------------------------------------------------------------*/
 /*-------------------------------------------------------------------------------
  ------------------------------------------------------------------------------*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizzme/pages/reportPermission.dart';
import 'package:pizzme/res/colori.dart';
import 'package:pizzme/res/values.dart';
import 'package:pizzme/util/sharedManager.dart';
import 'package:pizzme/util/userManager.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Values values = new Values();

  Colori _c = new Colori();

  final nameController = new TextEditingController();

  int _ordinazioni = UserData.orderNumber;
  @override
  void initState() {
    super.initState();
    UserData.init();
    setState(() {
      _ordinazioni = UserData.orderNumber;
    });
  }

  void setWhiteTheme() {
    setState(() {
      Colori.darkTheme = false;
      _c.changeTheme(false);
    });
    SharedManager.setWhiteTheme();
  }

  void setDarkTheme() {
    setState(() {
      Colori.darkTheme = true;
      _c.changeTheme(true);
    });
    SharedManager.setDarkTheme();
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

  void setName(String n) {
    UserData.setName(n);
    setState(() {
      UserData.name = n;
    });
  }

  void showAlert(String t) {
    var alertStyle = AlertStyle(
        backgroundColor: Colori.darkTheme
            ? Colori.darkThemePrimaryColorDark
            : Colori.lightThemePrimaryColorLight,
        animationType: AnimationType.fromBottom,
        animationDuration: Duration(microseconds: 600),
        alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(
                color: Colori.darkTheme
                    ? Colori.darkThemePrimaryColorDark
                    : Colori.lightThemePrimaryColorLight)),
        titleStyle: TextStyle(
            color: Colori.darkTheme ? Colors.white : Colors.black,
            fontFamily: 'Roboto',
            fontSize: 30.0));
    Alert(
        title: '',
        type: AlertType.info,
        context: context,
        style: alertStyle,
        content: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  labelText: 'Nome: ',
                  hintText: 'Mario'),
              cursorColor: Colori.darkTheme ? Colors.white : Colors.black,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              if (nameController.text == "") {
                this.setName('User');
              } else {
                this.setName(nameController.text);
              }
              Navigator.pop(context);
            },
            child: Text(
              "SALVA",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'Roboto'),
            ),
          )
        ]).show();
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
        child: ListView(
          children: <Widget>[
            Column(
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
                            margin: new EdgeInsets.only(left: 15.0),
                            child: InkWell(
                                onTap: () {
                                  this.showAlert('NOME');
                                },
                                child: Center(
                                  child: Text(
                                    UserData.name,
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(
                                      fontSize: 35.0,
                                      color: Colori.darkTheme
                                          ? Colors.white
                                          : Colors.black,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                )),
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
                                    ? Colori.endGradient
                                    : Colori.startGradient,
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
                                color: Colori.darkTheme
                                    ? Colors.white
                                    : Colors.black,
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
                                    ? Colori.endGradient
                                    : Colori.startGradient,
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
                                color: Colori.darkTheme
                                    ? Colors.white
                                    : Colors.black,
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
                                    this.setWhiteTheme();
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
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colori.darkTheme
                      ? Colori.darkThemePrimaryColorLight
                      : Colori.lightThemePrimaryColorLight,
                  child: InkWell(
                    onTap: () {
                      _launchURL(values.codeUrl);
                    },
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
                                      ? Colori.endGradient
                                      : Colori.startGradient,
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
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colori.darkTheme
                      ? Colori.darkThemePrimaryColorLight
                      : Colori.lightThemePrimaryColorLight,
                  child: InkWell(
                    onTap: () {
                      _launchURL(values.developerUrl);
                    },
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
                                      ? Colori.endGradient
                                      : Colori.startGradient,
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
                                  child: Text(
                                'Sviluppatore',
                                style: new TextStyle(
                                    color: Colori.darkTheme
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 20.0,
                                    fontFamily: 'Roboto'),
                              )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colori.darkTheme
                      ? Colori.darkThemePrimaryColorLight
                      : Colori.lightThemePrimaryColorLight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReportPermissionPage()),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                                margin: new EdgeInsets.only(
                                    top: 10.0, left: 20.0, bottom: 10.0),
                                child: Icon(
                                  Icons.phone_android,
                                  color: Colori.darkTheme
                                      ? Colori.endGradient
                                      : Colori.startGradient,
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
                                  child: Text(
                                'Permessi',
                                style: new TextStyle(
                                    color: Colori.darkTheme
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 20.0,
                                    fontFamily: 'Roboto'),
                              )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
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
