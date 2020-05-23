import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewTransactionScreen extends StatefulWidget {
  final Function addTransaction;
  AddNewTransactionScreen(this.addTransaction);
  @override
  _AddNewTransactionScreenState createState() =>
      _AddNewTransactionScreenState();
}

class _AddNewTransactionScreenState extends State<AddNewTransactionScreen> {
  DateTime selectedDate;
  String title;
  String priceText;
  void pickDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'title'),
              onChanged: (value) {
                title = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'price'),
              keyboardType: TextInputType.numberWithOptions(),
              onChanged: (value) {
                priceText = value;
              },
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? 'No date selected'
                        : 'selected date:  ${DateFormat.yMd().format(selectedDate)}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                FlatButton(
                    onPressed: pickDate,
                    child: Text(
                      'choose date',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 3)),
              child: FlatButton(
                onPressed: () => widget.addTransaction(
                    title: title,
                    priceText: priceText,
                    selectedDate: selectedDate),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  'Add Transaction',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                textColor: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
