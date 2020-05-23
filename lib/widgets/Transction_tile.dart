import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  final String price;
  final String title;
  final DateTime date;
  final Function delete;
  TransactionTile(
      {@required this.price,
      @required this.title,
      @required this.date,
      this.delete});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: Container(
            width: 100,
            height: 50,
            decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 3),
            ),
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
                child: Text(
              '\$$price',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
          ),
          title: Text(
            title,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(DateFormat.yMd().format(date)),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: delete,
          ),
        ),
      ),
    );
  }
}
