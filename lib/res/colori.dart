import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Colori{

  Color _startGradient = new Color(0xFFFD4A1E);
  Color _endGradient = new Color(0xFFB01054);

  Color _primaryColorLight = new Color(0xFFFFFFFF);

  Colori();

  Color getPrimaryColorLight(){
    return this._primaryColorLight;
  }

  Color getStartGradient(){
    return this._startGradient;
  }

  Color getEndGradient(){
    return this._endGradient;
  }

}