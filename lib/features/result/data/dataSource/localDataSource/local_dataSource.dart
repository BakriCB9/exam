import 'package:exam_app/features/exam/data/model/question_response/question_response.dart';

abstract class LocalDatasourceQuestion {
  Future<QuestionResponse>getQuestion();
  Future<Map<String,dynamic>>getallAnswer(); 
}