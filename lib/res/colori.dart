import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Colori{

  Color _startGradient = new Color(0xFFFD4A1E);
  Color _endGradient = new Color(0xFFB01054);

  Color _lighThemePrimaryColorLight = new Color(0xFFFFFFFF);
  Color _lighThemePrimaryColorDark = new Color(0xFFEBEBEB);

  Colori();

  Color getLighThemePrimaryColorLight(){
    return this._lighThemePrimaryColorLight;
  }
  Color getLightThemePrimaryColorDark(){
    return this._lighThemePrimaryColorDark;
  }

  Color getStartGradient(){
    return this._startGradient;
  }

  Color getEndGradient(){
    return this._endGradient;
  }

}