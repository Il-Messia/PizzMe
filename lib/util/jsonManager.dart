import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pizzme/res/values.dart';
import 'package:pizzme/util/storeManaget.dart';

class JsonManager {
  static Values values = new Values();

  static Future<List<StoreManager>> getStore() async {
    var data = await http.get(values.jsonUrl);

    var jsonData = json.decode(data.body);

    List<StoreManager> stores = [];

    for (var u in jsonData) {
      StoreManager s = new StoreManager(u['index'], u['Nome'], u['Contatto'],
          u['Descrizione'], u['MetodoPrenotazione'], u['Image']);
      stores.add(s);
    }

    print("Stores length: " + stores.length.toString());

    return stores;
  }
}
