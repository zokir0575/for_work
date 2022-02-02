class Contracts{
  String? id;
  String? fish;
  String? amount;
  String? lastInvoice;
  String? numInvoice;
  String? turn;
  String? date;

  Contracts({this.id, this.fish, this.amount, this.lastInvoice, this.numInvoice, this.turn, this.date});

  Contracts.fromJson(Map<String, dynamic> json) :
      id = json["id"],
      fish = json["fish"],
      amount = json["amount"],
      lastInvoice = json["lastInvoice"],
      numInvoice = json["numInvoice"],
      turn = json["turn"],
      date = json["date"];

  Map<String, dynamic> toJson() => {
    "id" : id,
    "fish" : fish,
    "amount" : amount,
    "lastInvoice" : lastInvoice,
    "numInvoice" : numInvoice,
    "turn" : turn,
    "date" : date,
  };
}