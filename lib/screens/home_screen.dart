import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/home_body.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
      ),
//
      body: HomeBody(),
    );
  }
}
