import 'package:flutter/cupertino.dart';

class Transaction {
  String priceText;
  String title;
  DateTime date;
  double price;

  Transaction(
      {@required this.title,
      @required this.priceText,
      @required this.price,
      @required this.date});
}
