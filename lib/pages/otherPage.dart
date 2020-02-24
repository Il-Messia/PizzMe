/*-------------------------------------------------------------------------------
  Created by Alex De Leo
  GitHub: https://github.com/Il-Messia
  Description: Simple app created through the Flutter framework. It allows the 
               ordering of pizzas for takeaway by message or call.
 ------------------------------------------------------------------------------*/
 /*-------------------------------------------------------------------------------
  ------------------------------------------------------------------------------*/

import 'package:flutter/material.dart';
import 'package:pizzme/res/colori.dart';

class OtherPage extends StatefulWidget {
  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        bottom: 20.0
      ),
      decoration: new BoxDecoration(
        color: Colori.darkTheme ? Colori.darkThemePrimaryColorDark:  Colori.lightThemePrimaryColorDark,
        borderRadius: new BorderRadius.all(
          Radius.circular(15.0)
        )
      ),
      child: Center(
        child: Text('Page not found'),
      ),
    );
  }
}