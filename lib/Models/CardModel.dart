class CardModel {
  int id;
  final String name;
  String bankName = '';
  final String number;
  final String currency;

  final int available;

  CardModel({
    this.id = 1,
    required this.name,
    this.bankName = '',
    required this.number,
    required this.currency,
    required this.available,
  });

  Map toJson() => {
        'id': id,
        'name': name,
        'bankName': bankName,
        'number': number,
        'currency': currency,
        'available': available,
      };
  CardModel.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        bankName = json['bankName'],
        number = json['number'],
        currency = json['currency'],
        available = json['available'];
}
