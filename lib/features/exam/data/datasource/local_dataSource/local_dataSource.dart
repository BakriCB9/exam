import 'package:exam_app/features/exam/data/model/question_response/question_response.dart';

abstract class LocalDataSource {
   
  Future<QuestionResponse> saveData();
  

}