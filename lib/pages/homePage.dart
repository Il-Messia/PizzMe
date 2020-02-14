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
    keyRefresh = new GlobalKey<RefreshIndicatorState>();
    listView = list();
  }

  Widget buildCard(BuildContext context, StoreManager storeManager) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(values.getDefaultRadius()),
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
                    child: new FadeInImage.assetNetwork(
                      height: values.getInfoCardHeight(),
                      width: MediaQuery.of(context).size.width -
                          (values.getDefaultMargin() * 4),
                      alignment: Alignment.center,
                      fit: BoxFit.scaleDown,
                      image: storeManager.imageLink,
                      fadeInCurve: Curves.bounceIn,
                      placeholder: 'images/launcher/Logo.png',
                    ),
                  )
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

  GlobalKey<RefreshIndicatorState> keyRefresh;

  Widget list() {
    return FutureBuilder(
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
    );
  }

  Widget listView;

  Future<void> refresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      listView = list();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(
          left: values.getDefaultMargin(),
          right: values.getDefaultMargin(),
          bottom: values.getBottomFromNavBarMargin()),
      decoration: new BoxDecoration(
          color: Colori.darkTheme
              ? Colori.darkThemePrimaryColorDark
              : Colori.lightThemePrimaryColorDark,
          borderRadius:
              new BorderRadius.all(Radius.circular(values.getDefaultRadius())),
          boxShadow: [
            new BoxShadow(
                color: Colors.black38,
                blurRadius: 5.0,
                spreadRadius: 5.0,
                offset: Offset(0.0, 5.0))
          ]),
      child: Center(
        child: Container(
          margin: EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(
                  Radius.circular(values.getDefaultRadius()))),
          child: RefreshIndicator(
            key: keyRefresh,
            onRefresh: () async {
              await refresh();
            },
            child: listView,
          ),
        ),
      ),
    );
  }
}
