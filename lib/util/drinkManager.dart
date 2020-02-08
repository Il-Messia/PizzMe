class DrinkManager{

  String drink;
  int counter;

  DrinkManager(this.drink, this.counter);

  @override
  String toString(){
    return this.drink + " x" + this.counter.toString();
  }

}