import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final int filledFlex;
  final int emptyFlex;
  final String amount;
  final String day;
  ChartBar(
      {this.filledFlex = 1,
      this.emptyFlex = 99,
      @required this.day,
      this.amount = '0'});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        children: <Widget>[
          Container(
            height: 20,
            child: FittedBox(
              child: Text('\$$amount'),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: emptyFlex,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: filledFlex,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(day),
        ],
      ),
    );
  }
}
