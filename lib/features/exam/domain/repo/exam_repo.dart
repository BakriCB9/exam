import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/exam/domain/entity/exam_entity/all_exam_of_one_subject.dart';
import 'package:exam_app/features/exam/domain/entity/question_entity/question_entity.dart';
import 'package:exam_app/features/exam/domain/entity/subject_entity/subject_entity.dart';

abstract class ExamRepo {
  Future<ApiResult<List<AllSubjectEntity>>> getAllSubject();
  Future<ApiResult<List<AllExamOfOneSubjectEntity>>> getAllExamOnSubject(
      String idOfSubject);
  Future<ApiResult<List<QuestionEntity>>> getAllQuestionOfExam(String examId);
  Future<void> saveAnswer(Map<String,dynamic>answers);
}
