import 'package:flutter/material.dart';
import 'package:pizzme/res/colori.dart';
import 'package:pizzme/res/values.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Colori _c = new Colori();
  Values values = new Values();

  String _name = "Name";

  bool _switched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(
          top: values.getAndroidStatusBarHeigth(),
          left: 15.0,
          right: 15.0,
          bottom: 20.0),
      decoration: new BoxDecoration(
          color: Colors.white,
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
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                        margin: new EdgeInsets.only(top: 60.0, left: 30.0),
                        child: CircleAvatar(
                          radius: values.getAvatarRadius(),
                          backgroundImage: AssetImage('images/def_avatar.png'),
                        ))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(left: 60.0, top: 50.0),
                      child: Center(
                        child: Text(
                          _name,
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            fontSize: 35.0,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: new EdgeInsets.only(top: 100.0),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(top: 5.0, left: 15.0),
                      child: Text(
                        'Ordinazioni effettuate:',
                        style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    )
                  ],
                ),
                Column()
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: new EdgeInsets.only(top: 5.0),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(top: 5.0, left: 15.0),
                      child: Text(
                        'Tema scuro',
                        style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                        margin: new EdgeInsets.only(top: 5.0, left: 15.0),
                        child: Switch(
                          value: _switched,
                          onChanged: (value) {
                            _switched = value;
                          },
                          activeTrackColor: _c.getStartGradient(),
                          activeColor: _c.getEndGradient(),
                        )),
                  ],
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: new EdgeInsets.only(top: 5.0),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(
                        top: 5.0,
                        left: 15.0
                      ),
                      child: Center(
                          child: SizedBox(
                          width: 300.0,
                          child: GestureDetector(
                            onTap: (){
                              _launchURL();
                            },
                            child: Text(
                              'Visualizza codice sorgente',
                              style: new TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Roboto'
                              ),
                            ),
                          ),
                        )
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
  const url = 'https://github.com/Il-Messia/PizzMe';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
}
