import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Colori{

  Color _startGradient = new Color(0xFFFD4A1E);
  Color _endGradient = new Color(0xFFB01054);

  Color _lighThemePrimaryColorLight = new Color(0xFFFFFFFF);
  Color _lighThemePrimaryColorDark = new Color(0xFFEBEBEB);

  Color _darkThemePrimaryColorMedium = new Color(0xFF1E2129);
  Color _darkThemePrimaryColorDark = new Color(0xFF171A23);
  Color _darkThemePrimaryColorLight = new Color(0xFF2F313E);

  Colori();

  Color getLighThemePrimaryColorLight(){
    return this._lighThemePrimaryColorLight;
  }
  Color getLightThemePrimaryColorDark(){
    return this._lighThemePrimaryColorDark;
  }

  Color getDarkThemePrimaryColorMedium(){
    return this._darkThemePrimaryColorMedium;
  }
  Color getDarkThemePrimaryColorLight(){
    return this._darkThemePrimaryColorLight;
  }
  Color getDarkThemePrimaryColorDark(){
    return this._darkThemePrimaryColorDark;
  }

  Color getStartGradient(){
    return this._startGradient;
  }

  Color getEndGradient(){
    return this._endGradient;
  }

}