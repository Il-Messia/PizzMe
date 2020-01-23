import 'package:flutter/material.dart';
import 'package:pizzme/res/colori.dart';
import 'package:pizzme/res/values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  bool _dark = false;
  Colori _c = new Colori();

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
  void initState(){
    super.initState();

    this._getIntFromShared();

  }

  Values values = new Values();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        bottom: 20.0
      ),
      decoration: new BoxDecoration(
        color: _dark ? _c.getDarkThemePrimaryColorDark(): _c.getLighThemePrimaryColorLight(),
        borderRadius: new BorderRadius.all(
          Radius.circular(15.0)
        ),
        boxShadow: [
          new BoxShadow(
            color: Colors.black38,
            blurRadius: 5.0,
            spreadRadius: 5.0,
            offset: Offset(
              -5.0,
              5.0
            )
          )
        ]
      ),
      child: Center(
        child: Text('ListPage'),
      ),
    );
  }
}