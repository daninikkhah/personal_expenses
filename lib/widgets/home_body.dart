import 'package:flutter/material.dart';
import 'package:personalexpenses/models/expense.dart';
import 'package:personalexpenses/widgets/Transction_tile.dart';
import 'package:personalexpenses/widgets/chart.dart';
import '../screens/add_new_transaction_screen.dart';
import '../models/expense.dart';

class HomeBody extends StatefulWidget {
//  final List<Transaction> transactions;
//  HomeBody(this.transactions);//TODO remove
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final List<Transaction> transactions = [
    Transaction(
        title: 'book', priceText: '23.00', price: 23, date: DateTime.now()),
    Transaction(
      title: 'shoes',
      priceText: '78.58',
      price: 58.58,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      title: 'phone',
      priceText: '89.99',
      price: 89.99,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
      title: 'HDD',
      priceText: '98',
      price: 98,
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
    Transaction(
      title: 'dress',
      priceText: '27.60',
      price: 27.6,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      title: 'pants',
      priceText: '27.60',
      price: 27.6,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      title: 'perfume',
      priceText: '27.60',
      price: 27.6,
      date: DateTime.now().subtract(Duration(days: 3)),
    )
  ];

  void openAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return AddNewTransactionScreen((
              {String title, String priceText, DateTime selectedDate}) {
            if (title != null && priceText != null && selectedDate != null) {
              setState(() {
                transactions.add(Transaction(
                    title: title,
                    priceText: priceText,
                    price: double.parse(priceText), //double.parse(price),
                    date: selectedDate));
              });
            } //todo else implement some error message
            Navigator.pop(context);
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    //TODO implement sorting transactions by date or price
    DateTime currentDate = DateTime.now();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
            flex: 5,
            child: Card(
              child: Chart(transactions),
            )),
        Expanded(
          flex: 14,
          child: ListView.builder(
            itemBuilder: (context, index) => TransactionTile(
              price: transactions[index].priceText,
              title: transactions[index].title,
              date: transactions[index].date,
              delete: () {
                setState(() {
                  transactions.removeAt(index);
                });
              },
            ),
            itemCount: transactions.length,
          ),
        ),
        Container(
          color: Theme.of(context).primaryColor,
          child: FlatButton(
            onPressed: () => openAddNewTransaction(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Add New Transaction',
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.add,
                    color: Theme.of(context).primaryColorLight,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
