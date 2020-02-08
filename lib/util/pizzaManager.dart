class PizzaManager{

  String gusto;
  int piece;

  PizzaManager(this.gusto, this.piece);

  @override
  String toString(){
    return this.gusto + " x" + this.piece.toString();
  }

}