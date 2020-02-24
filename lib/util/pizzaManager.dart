/*-------------------------------------------------------------------------------
  Created by Alex De Leo
  GitHub: https://github.com/Il-Messia
  Description: Simple app created through the Flutter framework. It allows the 
               ordering of pizzas for takeaway by message or call.
 ------------------------------------------------------------------------------*/
 /*-------------------------------------------------------------------------------
  ------------------------------------------------------------------------------*/

class PizzaManager{

  String gusto;
  int piece;

  PizzaManager(this.gusto, this.piece);

  @override
  String toString(){
    return this.gusto + " x" + this.piece.toString();
  }

}