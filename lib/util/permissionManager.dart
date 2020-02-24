/*-------------------------------------------------------------------------------
  Created by Alex De Leo
  GitHub: https://github.com/Il-Messia
  Description: Simple app created through the Flutter framework. It allows the 
               ordering of pizzas for takeaway by message or call.
 ------------------------------------------------------------------------------*/
 /*-------------------------------------------------------------------------------
  ------------------------------------------------------------------------------*/

import 'package:permission_handler/permission_handler.dart';

class PermissionManager{
  static bool _storage;
  static bool _phone;
  static bool _messages;

  static void init() async{
    PermissionStatus smsStatus = await PermissionHandler().checkPermissionStatus(PermissionGroup.sms);
    print(smsStatus);
    PermissionStatus phoneStatus = await PermissionHandler().checkPermissionStatus(PermissionGroup.phone);
    print(phoneStatus);
    PermissionStatus storageStatus = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    print(storageStatus);
    if(smsStatus == PermissionStatus.denied || smsStatus == PermissionStatus.unknown){
      _messages = false;
    }else{
      _messages = true;
    }
    if(phoneStatus == PermissionStatus.denied || phoneStatus == PermissionStatus.unknown){
      _phone = false;
    }else{
      _phone = true;
    }
    if(storageStatus == PermissionStatus.denied || storageStatus == PermissionStatus.unknown){
      _storage = false;
    }else{
      _storage = true;
    }
  }

  static void askMessagesPermission() async{
    if(!PermissionManager.getMessagesStatus()){
      await PermissionHandler().requestPermissions([PermissionGroup.sms]);
    }
  }

  static void askPhonePermission() async{
    if(!PermissionManager.getPhoneStatus()){
      await PermissionHandler().requestPermissions([PermissionGroup.phone]);
    }
  }

  static void askStoragePermission() async{
    if(!PermissionManager.getStorageStatus()){
      await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    }
  }

  static void setStorageStatus(bool status){
    _storage = status;
  }
  static void setPhoneStatus(bool status){
    _phone = status;
  }
  static void setMessageStatus(bool status){
    _messages = status;
  }

  static bool getStorageStatus(){
    return _storage;
  }
  static bool getPhoneStatus(){
    return _phone;
  }
  static bool getMessagesStatus(){
    return _messages;
  }

  static bool getAllPermissionStatus(){
    return _messages&&_phone&&_storage;
  }

}