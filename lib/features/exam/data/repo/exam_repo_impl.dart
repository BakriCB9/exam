import 'package:dio/dio.dart';
import 'package:exam_app/core/api_manager/api_result.dart';
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
}
