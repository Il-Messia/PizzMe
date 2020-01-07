import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Colori{

  Color _startGradient = new Color(0xFFFD4A1E);
  Color _endGradient = new Color(0xFFB01054);

  Colori();

  Color getStartGradient(){
    return this._startGradient;
  }

  Color getEndGradient(){
    return this._endGradient;
  }

}