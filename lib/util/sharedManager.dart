import 'package:pizzme/res/values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  static Values values = new Values();

  static Future<void> setPhoneNumber(String phone) async {
    final shared = await SharedPreferences.getInstance();
    await shared.setString(values.getKeyPhone(), phone);
  }

  static Future<String> getPhoneNumber() async {
    final shared = await SharedPreferences.getInstance();
    final result = shared.getString(values.getKeyPhone());
    if (result == null) {
      SharedManager.setDefaultName();
      return '00000000000';
    }
    return result;
  }

  static Future<void> setDarkTheme() async {
    final shared = await SharedPreferences.getInstance();
    await shared.setBool(values.getKeyTheme(), true);
  }

  static Future<void> setWhiteTheme() async {
    final shared = await SharedPreferences.getInstance();
    await shared.setBool(values.getKeyTheme(), false);
  }

  static Future<bool> getThemeFromShared() async {
    final shared = await SharedPreferences.getInstance();
    final result = shared.getBool(values.getKeyTheme());
    if (result == null) {
      SharedManager.setWhiteTheme();
      return false;
    }
    return result;
  }

  static Future<int> getOrderNumberFromShared() async {
    final shared = await SharedPreferences.getInstance();
    final result = shared.getInt(values.getKeyOrder());
    if (result == null) {
      SharedManager.setDefaultOrder();
      return 0;
    }
    return result;
  }

  static Future<void> setDefaultOrder() async {
    final shared = await SharedPreferences.getInstance();
    await shared.setInt(values.getKeyOrder(), 0);
  }

  static Future<void> setOrder(int n) async {
    final shared = await SharedPreferences.getInstance();
    await shared.setInt(values.getKeyOrder(), n);
  }

  static Future<String> getNameFromShared() async {
    final shared = await SharedPreferences.getInstance();
    final result = shared.getString(values.getKeyName());
    if (result == null) {
      SharedManager.setDefaultName();
      return 'User';
    }
    return result;
  }

  static Future<void> setDefaultName() async {
    final shared = await SharedPreferences.getInstance();
    await shared.setString(values.getKeyName(), "User");
  }

  static Future<void> setName(String n) async {
    final shared = await SharedPreferences.getInstance();
    await shared.setString(values.getKeyName(), n);
  }
}
