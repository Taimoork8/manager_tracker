class TransactionModel {
  int id;
  final String name;
  final int price;
  final String type;
  final String currency;

  TransactionModel({
    this.id = 1, 
    required this.name, 
    required this.price, 
    required this.type, 
    required this.currency});
}
