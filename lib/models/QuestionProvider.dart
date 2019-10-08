import 'package:flag_quiz/models/DatabaseConnector.dart';
import 'package:flag_quiz/models/Enum.dart';
import 'package:flag_quiz/models/Question.dart';

class QuestionProvider {
  var _collections = List<Question>();

  initializeQuestions({Difficulty level: Difficulty.EASY}) async {
    var db = DatabaseConnector();
    var countries = await db.collectCountries(count: 100);
    for (var i = 0; i < 100; i++) {
      
    }
  }

  List<Question> getCollections() => this._collections;
}
