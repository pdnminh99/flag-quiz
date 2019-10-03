import 'package:flag_quiz/models/Enum.dart';
import 'package:flag_quiz/models/Question.dart';

class QuestionProvider {
  var _collections = List<Question>();

  QuestionProvider({Difficulty level: Difficulty.EASY});

  List<Question> getCollections() => this._collections;
}
