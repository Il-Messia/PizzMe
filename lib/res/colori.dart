import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Colori with ChangeNotifier{

  static bool darkTheme = false;

  void changeTheme(bool value){
    darkTheme = value;
    notifyListeners();
  }

  bool getTheme(){
    return darkTheme;
  }

  static Color startGradient = new Color(0xFFFD4A1E);
  static Color endGradient = new Color(0xFFB01054);

  static Color lightThemePrimaryColorLight = new Color(0xFFFFFFFF);
  static Color lightThemePrimaryColorDark = new Color(0xFFEBEBEB);

  static Color darkThemePrimaryColorMedium = new Color(0xFF1E2129);
  static Color darkThemePrimaryColorDark = new Color(0xFF171A23);
  static Color darkThemePrimaryColorLight = new Color(0xFF2F313E);

}