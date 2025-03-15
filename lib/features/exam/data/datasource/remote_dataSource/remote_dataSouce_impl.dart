import 'package:exam_app/config/constants.dart';
import 'package:exam_app/core/api_manager/api_manager.dart';
import 'package:exam_app/core/local_secure_storage/flutter_secure_storage.dart';
import 'package:exam_app/features/exam/data/datasource/remote_dataSource/remote_dataSource.dart';
import 'package:exam_app/features/exam/data/model/all_exam_on_subject/all_exam_on_subject.dart';
import 'package:exam_app/features/exam/data/model/all_subject/all_subject.dart';
import 'package:exam_app/features/exam/data/model/question_response/question_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoteDatasourceExam)
class RemoteDatasouceImplExam extends RemoteDatasourceExam {
  ApiManager apiManager;
  RemoteDatasouceImplExam(this.apiManager);
  @override
  Future<AllSubject> getAllSubject() async {
    final userToken = await LocalStroage().getToken(key: AppCashConstant.token);
    final ans = await apiManager.get(
        endpoint: AppConstants.allSubject, token: userToken);
    return AllSubject.fromJson(ans.data);
  }

  @override
  Future<AllExamOnSubject> getAllExamOnSubject(String idOfSubject) async {
    final userToken = await LocalStroage().getToken(key: AppCashConstant.token);
    final ans = await apiManager.get(
        endpoint: AppConstants.allExamOnSubject,
        token: userToken,
        queryParam: {'subject': idOfSubject});

    return AllExamOnSubject.fromJson(ans.data);
  }

  Future<QuestionResponse> getAllQuestionOfExam(String examId) async {
    final userToken = await LocalStroage().getToken(key: AppCashConstant.token);
    final ans = await apiManager.get(
        endpoint: AppConstants.allQuestionOfexam,
        queryParam: {'exam': examId},
        token: userToken);
    return QuestionResponse.fromJson(ans.data);
  }
}
