import 'package:flutter/material.dart';
import 'package:personalexpenses/models/expense.dart';
import 'package:personalexpenses/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

const int chartBarNumber = 7;

class Chart extends StatelessWidget {
  final List<Transaction> transactions;
  Chart(this.transactions);
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    List<Map<String, Object>> weeklyExpenses = [];
    double totalSum = 0;
    //TODO WTF!  cant define List<Map<String,double>>

    for (int index = 0; index < chartBarNumber; index++) {
      DateTime currentDay = today.subtract(Duration(days: index));
      double sum = 0;

      for (Transaction currentTransaction in transactions) {
        if (currentDay.day == currentTransaction.date.day &&
            currentDay.month == currentTransaction.date.month &&
            currentDay.year == currentTransaction.date.year)
          sum += currentTransaction.price;
      }
      totalSum += sum;
      weeklyExpenses.add({
        'day': DateFormat.E().format(currentDay).substring(0, 1),
        'amount': sum,
      });
    }

    List<Widget> createChartBars() {
      List<Widget> output = [];
      for (int i = 0; i < chartBarNumber; i++) {
        double filledFlex = weeklyExpenses[i]['amount'];
        double emptyFlex = totalSum - weeklyExpenses[i]['amount'];
        output.add(
          Expanded(
            child: ChartBar(
              amount: filledFlex.round().toString(),
              day: weeklyExpenses[i]['day'],
              filledFlex: filledFlex.ceil(),
              emptyFlex: emptyFlex.floor(),
            ),
          ),
        );
      }
      return output;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: createChartBars(),
        ),
      ),
    );
  }
}
