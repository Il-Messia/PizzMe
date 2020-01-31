import 'package:permission/permission.dart';

class PermissionManager{
  static bool _storage;
  static bool _phone;
  static bool _messages;

  static void init() async{
    var temp = await Permission.getPermissionsStatus([PermissionName.SMS, PermissionName.Phone, PermissionName.Storage]);
    if(temp[0].permissionStatus == PermissionStatus.deny || temp[0].permissionStatus == PermissionStatus.notAgain || temp[0].permissionStatus == PermissionStatus.notDecided) {
      PermissionManager.setMessageStatus(false);
    }else{
      PermissionManager.setMessageStatus(true);
    }
    if(temp[1].permissionStatus == PermissionStatus.deny || temp[1].permissionStatus == PermissionStatus.notAgain || temp[1].permissionStatus == PermissionStatus.notDecided){
      PermissionManager.setPhoneStatus(false);
    }else{
      PermissionManager.setPhoneStatus(true);
    }
    if(temp[2].permissionStatus == PermissionStatus.deny || temp[2].permissionStatus == PermissionStatus.notAgain || temp[2].permissionStatus == PermissionStatus.notDecided || temp[2].permissionStatus == PermissionStatus.notAgain){
      PermissionManager.setStorageStatus(false);
    }else{
      PermissionManager.setStorageStatus(true);
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

}