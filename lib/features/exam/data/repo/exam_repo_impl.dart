import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/core/api_manager/excuter/api_excuter.dart';
import 'package:exam_app/features/exam/data/datasource/remote_dataSource/remote_dataSource.dart';
import 'package:exam_app/features/exam/data/model/all_subject/all_subject.dart';
import 'package:exam_app/features/exam/domain/entity/subject_entity.dart/subject_entity.dart';
import 'package:exam_app/features/exam/domain/repo/exam_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamRepo)
class ExamRepoImpl extends ExamRepo {
  RemoteDatasourceExam remoteDatasourceExam;
  ExamRepoImpl(this.remoteDatasourceExam);
  @override
  Future<ApiResult<List<AllSubjectEntity>>> getAllSubject() async {
    ApiResult<AllSubject> ans = await excuteApi<AllSubject>(() {
      return remoteDatasourceExam.getAllSubject();
    });
    switch (ans) {
      case SuccessApiResult():
        {
          final list = ans.data?.subjects?.map((subjectElement) {
            return subjectElement.toAllSubjectEntity();
          }).toList();
          return SuccessApiResult<List<AllSubjectEntity>>(list);
        }
      case ErrorApiResult():
        {
          return ErrorApiResult<List<AllSubjectEntity>>(ans.exception);
        }
    }
  }
}
