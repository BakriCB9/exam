import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:exam_app/config/constants.dart';
import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/core/api_manager/excuter/api_excuter.dart';
import 'package:exam_app/core/local_secure_storage/flutter_secure_storage.dart';
import 'package:exam_app/features/exam/data/datasource/remote_dataSource/remote_dataSource.dart';
import 'package:exam_app/features/exam/data/model/all_exam_on_subject/all_exam_on_subject.dart';
import 'package:exam_app/features/exam/data/model/all_subject/all_subject.dart';
import 'package:exam_app/features/exam/data/model/question_response/question_response.dart';
import 'package:exam_app/features/exam/domain/entity/exam_entity/all_exam_of_one_subject.dart';
import 'package:exam_app/features/exam/domain/entity/question_entity/question_entity.dart';
import 'package:exam_app/features/exam/domain/entity/subject_entity/subject_entity.dart';
import 'package:exam_app/features/exam/domain/repo/exam_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamRepo)
class ExamRepoImpl extends ExamRepo {
  RemoteDatasourceExam remoteDatasourceExam;
  LocalStroage localStroage;
  ExamRepoImpl(this.remoteDatasourceExam, this.localStroage);
  @override
  Future<ApiResult<List<AllSubjectEntity>>> getAllSubject() async {
    try {
      AllSubject ans = await remoteDatasourceExam.getAllSubject();
      final list = ans.subjects?.map((subjectElement) {
        return subjectElement.toAllSubjectEntity();
      }).toList();
      return SuccessApiResult<List<AllSubjectEntity>>(list);
    } on DioException catch (exception) {
      return ErrorApiResult<List<AllSubjectEntity>>(exception);
    }
  }

  @override
  Future<ApiResult<List<AllExamOfOneSubjectEntity>>> getAllExamOnSubject(
      String id) async {
    ApiResult<AllExamOnSubject> ans = await excuteApi<AllExamOnSubject>(() {
      return remoteDatasourceExam.getAllExamOnSubject(id);
    });
    switch (ans) {
      case SuccessApiResult():
        {
          final list = ans.data?.exams?.map((item) {
            return item.toAllExamEntity();
          }).toList();
          return SuccessApiResult<List<AllExamOfOneSubjectEntity>>(list);
        }
      case ErrorApiResult():
        {
          return ErrorApiResult<List<AllExamOfOneSubjectEntity>>(ans.exception);
        }
    }
  }

  Future<ApiResult<List<QuestionEntity>>> getAllQuestionOfExam(
      String examId) async {
    ApiResult<QuestionResponse> ans = await excuteApi<QuestionResponse>(() {
      return remoteDatasourceExam.getAllQuestionOfExam(examId);
    });
    switch (ans) {
      case SuccessApiResult():
        {
          final list = ans.data!.questions!.map((item) {
            return item.toQuestionEntity();
          }).toList();
          final localData = jsonEncode(ans);

          localStroage.saveToken(
              key: AppCashConstant.htmlExam, value: localData);
          return SuccessApiResult<List<QuestionEntity>>(list);
        }
      case ErrorApiResult():
        {
          return ErrorApiResult<List<QuestionEntity>>(ans.exception);
        }
    }
  }
  
  @override
  Future<void> saveAnswer(Map<String,dynamic>answers) async{
     final encodAnswer=jsonEncode(answers);
      localStroage.saveToken(key: AppCashConstant.answer, value: encodAnswer);
  }
  
}
