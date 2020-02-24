/*-------------------------------------------------------------------------------
  Created by Alex De Leo
  GitHub: https://github.com/Il-Messia
  Description: Simple app created through the Flutter framework. It allows the 
               ordering of pizzas for takeaway by message or call.
 ------------------------------------------------------------------------------*/
 /*-------------------------------------------------------------------------------
  ------------------------------------------------------------------------------*/

import 'package:flutter_sms/flutter_sms.dart';

class SmsManager {
  String _message;
  List<String> _recipents;

  String getMessage() {
    return this._message;
  }

  List<String> getRecipents() {
    return this._recipents;
  }

  void setMessage(String msg) {
    this._message = msg;
  }

  void setRecipents(List<String> list) {
    this._recipents = list;
  }

  void sendSMS() async {
    String _result =
        await FlutterSms.sendSMS(message: _message, recipients: _recipents)
            .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

  void sendTestSms() async {
    List<String> r = ["3347520736", "3271560964", "3311658130"];
    String _result = await FlutterSms.sendSMS(message: "Messaggio invitato con l'app PizzMe", recipients: r).catchError((onError){
      print(onError);
    });
    print(_result);
  }
}
