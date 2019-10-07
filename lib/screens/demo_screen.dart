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
      for (var country in this.countries) {
        print("${country.name}\n");
      }
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
        mainAxisSize: MainAxisSize.min,
        children: parseImage(this.countries),
      ),
    ),
  );

  List<Widget> parseImage(List<Country> countries) {
    var imageParser = List<Widget>();
    for (var country in countries) {
      print('${country.name} has flag dir ${country.flag}');
      imageParser.add(Image.asset('${country.flag}'));
    }
    print("total widgets are ${imageParser.length}");
    return imageParser;
  }

}