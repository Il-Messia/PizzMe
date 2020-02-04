import 'package:pizzme/res/values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedManager{

  static Values values;

  static Future<void> setDarkTheme() async {
    final shared = await SharedPreferences.getInstance();
    await shared.setBool(values.getKeyTheme(), true);
  }
  static Future<void> setWhiteTheme() async {
    final shared = await SharedPreferences.getInstance();
    await shared.setBool(values.getKeyTheme(), false);
  }

  static Future<bool> getIntFromShared() async {
    final shared = await SharedPreferences.getInstance();
    final result = shared.getBool("THEME");
    if (result == null) {
      SharedManager.setWhiteTheme();
    } else {
      return result;
    }
    return result;
  }

}