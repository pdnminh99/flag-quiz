import 'package:flag_quiz/models/Country.dart';
import 'package:flag_quiz/models/DatabaseConnector.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class DemoScreen extends State<MyApp> {

  var countries = List<Country>();

  DemoScreen() {
    var database = DatabaseConnector();
    database.collectCountries().then((countries) {
      setState(() {
       this.countries = countries;
      });
      print("There are ${countries.length} countries retrieved");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: parseView(),
    );
  }

  Widget parseView() => Scaffold(
    appBar: AppBar(
        title: Text("Test"),
      ),
    body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text("Test SQLite queries"),
          for (var country in this.countries) Image.asset(country.flag)
        ],
      ),
    ),
  );
}