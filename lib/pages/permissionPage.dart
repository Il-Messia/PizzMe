import 'package:flutter/material.dart';
import 'package:pizzme/pages/pages.dart';
import 'package:pizzme/res/colori.dart';
import 'package:pizzme/res/values.dart';
import 'package:pizzme/util/permissionManager.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PermissionPage extends StatefulWidget {
  @override
  _PermissionPage createState() => _PermissionPage();
}

class _PermissionPage extends State<PermissionPage> {
  Values values = new Values();

  @override
  void initState() {
    super.initState();
  }

  void _showAlert(String t, String m) {
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
            fontFamily: 'Roboto'),
        descStyle: TextStyle(
            color: Colori.darkTheme ? Colors.white : Colors.black,
            fontFamily: 'Roboto'));
    Alert(
      context: context,
      type: AlertType.info,
      title: t,
      style: alertStyle,
      desc: m,
      buttons: [
        DialogButton(
          child: Text(
            "Okay",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Roboto'),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(
              colors: [Colori.startGradient, Colori.endGradient]),
          width: 120,
        )
      ],
    ).show();
  }

  Future<void> _refreshPermissionStatus() async {
    setState(() {
      PermissionManager.init();
    });
  }

  void _nextPage() {
    if (PermissionManager.getPhoneStatus() &&
        PermissionManager.getStorageStatus() &&
        PermissionManager.getMessagesStatus()) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Pages()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
        elevation: 5.0,
        focusColor: Colori.darkTheme ? Colori.startGradient : Colori.endGradient,
        splashColor: Colori.darkTheme ? Colori.startGradient : Colori.endGradient,
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Pages()));
        },
        backgroundColor:
            Colori.darkTheme ? Colori.endGradient : Colori.startGradient,
        child: new Icon(
          Icons.skip_next,
          color: Colors.white,
        ),
      ),
      body: new Container(
          decoration: new BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colori.startGradient,
                  Colori.endGradient,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                tileMode: TileMode.clamp),
          ),
          child: new SafeArea(
            child: new Container(
              margin:
                  new EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
              decoration: new BoxDecoration(
                  color: Colori.darkTheme
                      ? Colori.darkThemePrimaryColorDark
                      : Colori.lightThemePrimaryColorLight,
                  borderRadius: new BorderRadius.all(Radius.circular(15.0)),
                  boxShadow: [
                    new BoxShadow(
                        color: Colors.black38,
                        blurRadius: 5.0,
                        spreadRadius: 5.0,
                        offset: Offset(0.0, 5.0))
                  ]),
              child: Center(
                  child: new Column(
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.all(5.0),
                    child: new Text(
                      'ATTENZIONE!',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        fontSize: 30.0,
                        color: Colori.darkTheme ? Colors.white : Colors.black,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: () {
                      this._showAlert("Attenzione",
                          "L'app richiede dei permessi per poter funzionare correttamente, se non venissero concessi si potrebbero riscontrare degli errori!");
                    },
                    child: new Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: new EdgeInsets.only(
                            top: 5.0, left: 5.0, right: 5.0, bottom: 5.0),
                        color: Colori.darkTheme
                            ? Colori.darkThemePrimaryColorDark
                            : Colori.lightThemePrimaryColorDark,
                        child: new Container(
                          padding: const EdgeInsets.all(5.0),
                          child: new Text(
                            'Per poter utilizzare al meglio questa app sono richiesti i seguenti permessi:',
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                              fontSize: 24.0,
                              color: Colori.darkTheme
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        )),
                  ),
                  new GestureDetector(
                    onTap: () {
                      this._refreshPermissionStatus();
                      if (PermissionManager.getStorageStatus()) {
                        this._showAlert(
                            "Storage", "Questo permesso è stato già concesso!");
                      } else {
                        PermissionManager.askStoragePermission();
                        this._refreshPermissionStatus();
                        this._nextPage();
                        PermissionManager.setStorageStatus(true);
                      }
                    },
                    child: new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: new EdgeInsets.only(
                          top: 5.0, left: 5.0, right: 5.0, bottom: 5.0),
                      color: Colori.darkTheme
                          ? Colori.darkThemePrimaryColorDark
                          : Colori.lightThemePrimaryColorDark,
                      child: new Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                  margin: new EdgeInsets.only(
                                      top: 10.0, left: 20.0, bottom: 10.0),
                                  child: Icon(
                                    PermissionManager.getStorageStatus()
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank,
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
                                  'Storage',
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
                  ),
                  new GestureDetector(
                    onTap: () {
                      if (PermissionManager.getPhoneStatus()) {
                        this._refreshPermissionStatus();
                        this._showAlert(
                            "Phone", "Questo permesso è stato già concesso!");
                      } else {
                        PermissionManager.askPhonePermission();
                        this._refreshPermissionStatus();
                        this._nextPage();
                        PermissionManager.setPhoneStatus(true);
                      }
                    },
                    child: new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: new EdgeInsets.only(
                          top: 5.0, left: 5.0, right: 5.0, bottom: 5.0),
                      color: Colori.darkTheme
                          ? Colori.darkThemePrimaryColorDark
                          : Colori.lightThemePrimaryColorDark,
                      child: new Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                  margin: new EdgeInsets.only(
                                      top: 10.0, left: 20.0, bottom: 10.0),
                                  child: Icon(
                                    PermissionManager.getPhoneStatus()
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank,
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
                                  'Phone',
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
                  ),
                  new GestureDetector(
                    onTap: () {
                      if (PermissionManager.getMessagesStatus()) {
                        this._refreshPermissionStatus();
                        this._showAlert(
                            "SMS", "Questo permesso è stato già concesso!");
                      } else {
                        PermissionManager.askMessagesPermission();
                        this._refreshPermissionStatus();
                        this._nextPage();
                        PermissionManager.setMessageStatus(true);
                      }
                    },
                    child: new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: new EdgeInsets.only(
                          top: 5.0, left: 5.0, right: 5.0, bottom: 5.0),
                      color: Colori.darkTheme
                          ? Colori.darkThemePrimaryColorDark
                          : Colori.lightThemePrimaryColorDark,
                      child: new Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                  margin: new EdgeInsets.only(
                                      top: 10.0, left: 20.0, bottom: 10.0),
                                  child: Icon(
                                    PermissionManager.getMessagesStatus()
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank,
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
                                  'SMS',
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
                  )
                ],
              )),
            ),
          )),
    );
  }
}
