import 'package:exam_app/features/exam/data/model/all_exam_on_subject/all_exam_on_subject.dart';
import 'package:exam_app/features/exam/data/model/all_subject/all_subject.dart';
import 'package:exam_app/features/exam/data/model/question_response/question_response.dart';

abstract class RemoteDatasourceExam {
  Future<AllSubject> getAllSubject();
  Future<AllExamOnSubject> getAllExamOnSubject(String idOfSubject);
  Future<QuestionResponse>getAllQuestionOfExam(String examId);

}
