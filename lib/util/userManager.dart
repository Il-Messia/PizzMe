import 'package:pizzme/util/sharedManager.dart';

class UserData{

  static String name;
  static int orderNumber;
  static String imagePath;

  UserData(){ 
    UserData.imagePath = "";
    UserData.name = "";
    UserData.orderNumber = 0;
  }

  static Future<void> init() async{
    UserData.name = await SharedManager.getNameFromShared();
    UserData.orderNumber = await SharedManager.getOrderNumberFromShared();
  }

  static Future<void> setName(String n) async{
    SharedManager.setName(n);
  }

}