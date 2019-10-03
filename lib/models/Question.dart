import 'package:flag_quiz/models/Country.dart';

class Question {
  String flagImage = "";
  var nomination = List<Country>();
  int time = 5000;
  bool verifyAnswer() => true;
}
