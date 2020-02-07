import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pizzme/res/colori.dart';
import 'package:pizzme/util/sharedManager.dart';
import 'package:pizzme/util/storeManaget.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  StoreManager storeManager;

  InfoPage({@required this.storeManager});

  _launchURL(url) async {
    if (await canLaunch(url)) {
      print("Opening url");
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new SpeedDial(
        marginRight: 18,
        marginBottom: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colori.darkTheme
            ? Colori.darkThemePrimaryColorDark
            : Colori.lightThemePrimaryColorDark,
        overlayOpacity: 0.2,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor:
            Colori.darkTheme ? Colori.endGradient : Colori.startGradient,
        foregroundColor: Colors.black,
        elevation: 5.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Icon(Icons.call),
              backgroundColor: Colors.red,
              label: 'Chiama',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                String aux = storeManager.phone;
                final phone = 'tel:$aux';
                this._launchURL(phone);
              }),
          SpeedDialChild(
            child: Icon(Icons.save),
            backgroundColor: Colors.blue,
            label: 'Salva',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              var aux = storeManager.phone;
              SharedManager.setPhoneNumber(storeManager.phone);
              Fluttertoast.showToast(
                  msg: "Savataggio del numero: $aux",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  fontSize: 16.0);
            },
          ),
        ],
      ),
      body: Container(
          color: Colori.darkTheme
              ? Colori.darkThemePrimaryColorDark
              : Colori.lightThemePrimaryColorDark,
          child: Column(
            children: <Widget>[
              Container(
                height: 100.0,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  borderRadius:
                      new BorderRadius.only(bottomRight: Radius.circular(30.0)),
                  gradient: LinearGradient(
                      colors: [
                        Colori.startGradient,
                        Colori.endGradient,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      tileMode: TileMode.clamp),
                ),
                child: SafeArea(
                  child: Container(
                    margin: new EdgeInsets.only(top: 5.0, left: 25.0),
                    child: new Text(
                      storeManager.name,
                      style: new TextStyle(
                          color: Colori.darkTheme ? Colors.white : Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                height: 250.0,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  alignment: Alignment.center,
                  fit: BoxFit.scaleDown,
                  image: NetworkImage(storeManager.imageLink),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15.0, top: 15.0),
                          child: Text(
                            'Descrizione:',
                            style: new TextStyle(
                                color: Colori.darkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: 'Roboto',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    new Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15.0, top: 15.0),
                          child: Text(
                            storeManager.description,
                            style: new TextStyle(
                                color: Colori.darkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: 'Roboto',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
