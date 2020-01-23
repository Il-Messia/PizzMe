import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizzme/res/colori.dart';
import 'package:pizzme/res/values.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Colori _c = new Colori();
  Values values = new Values();

  String _name = "Name";

  int _ordinazioni = 0;

  bool _dark = false;

  @override
  void initState() {
    super.initState();

    this._getIntFromShared();
  }

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
    }
    return result;
  }

  Future<void> setDefaultTheme() async{
    final shared = await SharedPreferences.getInstance();
    await shared.setBool(values.getKeyTheme(), false);
    setState(() {
      _dark = false;
    });
  }

  Future<void> setDarkTheme() async{
    final shared = await SharedPreferences.getInstance();
    await shared.setBool(values.getKeyTheme(), true);
    setState(() {
      _dark = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: _dark ? _c.getDarkThemePrimaryColorDark():  _c.getLighThemePrimaryColorLight(), 
      systemNavigationBarIconBrightness: _dark ? Brightness.light : Brightness.dark,
      statusBarIconBrightness: _dark ? Brightness.light : Brightness.dark,
    ));
    return Container(
      margin: new EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          bottom: 20.0),
      decoration: new BoxDecoration(
          color: _dark ? _c.getDarkThemePrimaryColorMedium():  _c.getLightThemePrimaryColorDark(),
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
              margin: new EdgeInsets.only(top: 5.0, left : 5.0, right: 5.0, bottom: 5.0),
              color: _dark ? _c.getDarkThemePrimaryColorLight():  _c.getLighThemePrimaryColorLight(),
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
                              color: _dark? Colors.white:Colors.black,
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
              color: _dark ? _c.getDarkThemePrimaryColorLight():  _c.getLighThemePrimaryColorLight(),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: new EdgeInsets.only(
                            top: 10.0, left: 20.0, bottom: 10.0),
                        child: Text(
                          'Ordinazioni effettuate: $_ordinazioni',
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: _dark? Colors.white:Colors.black,
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
              color: _dark ? _c.getDarkThemePrimaryColorLight():  _c.getLighThemePrimaryColorLight(),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: new EdgeInsets.only(
                            top: 10.0, left: 20.0, bottom: 10.0),
                        child: Text(
                          'Tema scuro',
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: _dark? Colors.white:Colors.black,
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
                            value: _dark,
                            onChanged: (value) {
                              if(value){
                                this.setDarkTheme();
                              }else{
                                this.setDefaultTheme();
                              }
                            },
                            activeTrackColor: _c.getStartGradient(),
                            activeColor: _c.getEndGradient(),
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
              color: _dark ? _c.getDarkThemePrimaryColorLight():  _c.getLighThemePrimaryColorLight(),
              child: Row(
                children: <Widget>[
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
                              _launchURL();
                            },
                            child: Text(
                              'Visualizza codice sorgente',
                              style: new TextStyle(
                                color: _dark? Colors.white:Colors.black,
                                  fontSize: 20.0, fontFamily: 'Roboto'),
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

  _launchURL() async {
    const url = 'https://github.com/Il-Messia/PizzMe';
    if (await canLaunch(url)) {
      print("Opening url");
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
