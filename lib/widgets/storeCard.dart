import 'package:flutter/material.dart';
import 'package:pizzme/res/colori.dart';
import 'package:pizzme/util/storeManaget.dart';

class StoreCard extends StatelessWidget {
  StoreManager storeManager;

  StoreCard({@required this.storeManager});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colori.darkTheme
            ? Colori.darkThemePrimaryColorLight
            : Colori.lightThemePrimaryColorLight,
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Container(
                    height: 300.0,
                    child: Image(
                        image: NetworkImage(
                      storeManager.imageLink,
                    )),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Text(
                    storeManager.name,
                    style: new TextStyle(
                        color: Colori.darkTheme ? Colors.white : Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 25.0),
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  new Text(
                    storeManager.description,
                    style: new TextStyle(
                        color: Colori.darkTheme ? Colors.white70 : Colors.black87,
                        fontFamily: 'Roboto',
                        fontSize: 12.0),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
