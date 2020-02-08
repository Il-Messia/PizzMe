import 'package:flutter/material.dart';
import 'package:pizzme/res/colori.dart';
import 'package:pizzme/res/values.dart';
import 'package:pizzme/util/jsonManager.dart';
import 'package:pizzme/util/storeManaget.dart';

import 'infoPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Values values = new Values();

  @override
  void initState() {
    super.initState();
  }

  Widget buildCard(BuildContext context, StoreManager storeManager) {
    return Card(
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
                builder: (context) => InfoPage(
                      storeManager: storeManager,
                    )),
          );
        },
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Container(
                    child: new Image(
                        height: 150.0,
                        width: MediaQuery.of(context).size.width - (20.0 * 2),
                        alignment: Alignment.center,
                        fit: BoxFit.scaleDown,
                        image: new NetworkImage(storeManager.imageLink)),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  Container(
                    margin: new EdgeInsets.only(left: 15.0, bottom: 15.0),
                    child: new Text(
                      storeManager.name,
                      style: new TextStyle(
                          color: Colori.darkTheme ? Colors.white : Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
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
        child: Container(
          margin: EdgeInsets.only(top:10.0, bottom:10.0),
          child: FutureBuilder(
            future: JsonManager.getStore(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) =>
                      this.buildCard(context, snapshot.data[index]),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
