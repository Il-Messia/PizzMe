/*-------------------------------------------------------------------------------
  Created by Alex De Leo
  GitHub: https://github.com/Il-Messia
  Description: Simple app created through the Flutter framework. It allows the 
               ordering of pizzas for takeaway by message or call.
 ------------------------------------------------------------------------------*/
 /*-------------------------------------------------------------------------------
  ------------------------------------------------------------------------------*/

class StoreManager {
  int index;
  String name;
  String phone;
  String description;
  String metodoPrenotazione;
  String imageLink;

  StoreManager(this.index, this.name, this.phone, this.description,
      this.metodoPrenotazione, this.imageLink);
}
