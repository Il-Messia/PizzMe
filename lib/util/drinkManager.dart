/*-------------------------------------------------------------------------------
  Created by Alex De Leo
  GitHub: https://github.com/Il-Messia
  Description: Simple app created through the Flutter framework. It allows the 
               ordering of pizzas for takeaway by message or call.
 ------------------------------------------------------------------------------*/
 /*-------------------------------------------------------------------------------
  ------------------------------------------------------------------------------*/

class DrinkManager{

  String drink;
  int counter;

  DrinkManager(this.drink, this.counter);

  @override
  String toString(){
    return this.drink + " x" + this.counter.toString();
  }

}