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
      type: AlertType.info,
      title: "Informazioni",
      style: alertStyle,
      desc:
          "L'app necessita dell'accesso a internet per poter scaricare e aggiornare la lista delle pizzerie e l'accesso alla memoria di messa per salvare gli ordini.",
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
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
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
            decoration: new BoxDecoration(
                color: Colori.darkTheme
                    ? Colori.darkThemePrimaryColorDark
                    : Colori.lightThemePrimaryColorDark,
                borderRadius: BorderRadius.all(
                    Radius.circular(values.getExternalSplashRadius())),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black38,
                      blurRadius: 5.0,
                      spreadRadius: 5.0,
                      offset: Offset(0, 2.5))
                ]),
            margin: new EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
            child: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new GestureDetector(
                      onTap: () {
                        this._showAlert();
                      },
                      child: new Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colori.darkTheme
                            ? Colori.darkThemePrimaryColorLight
                            : Colori.lightThemePrimaryColorLight,
                        child: new Center(
                          child: new Text(
                              'Questa app per poter funzionare correttamente necessita dei seguenti premessi:'),
                        ),
                      ),
                    )
                  ],
                ),
                new Row(children: <Widget>[
                  new GestureDetector(
                    child: new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colori.darkTheme
                          ? Colori.darkThemePrimaryColorLight
                          : Colori.lightThemePrimaryColorLight,
                      child: new Center(
                        child: new Text(
                            'Questa app per poter funzionare correttamente necessita dei seguenti premessi:'),
                      ),
                    ),
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
