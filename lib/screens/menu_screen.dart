import 'package:flag_quiz/models/DatabaseConnector.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  Widget _parseSQLiteDataToScreen() {
    var database = DatabaseConnector();
    database.initializeConnector();
    database.collectCountries().then((countries) {
      return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          for (var country in countries) Text('${country.name}')
        ],
      ),
    ));
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return _parseSQLiteDataToScreen();
    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: <Widget>[
    //         Text(
    //           'Test\nMenu Screen',
    //           style: TextStyle(
    //             fontSize: 30,
    //           ),
    //           textAlign: TextAlign.center,
    //         ),
    //         Image.asset('assets/images/flag-of-Vietnam.png'),
    //       ],
    //     ),
    //   ),
    // );
  }
}
