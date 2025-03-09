import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/exam/domain/entity/subject_entity.dart/subject_entity.dart';

abstract class ExamRepo {
  Future<ApiResult<List<AllSubjectEntity>>> getAllSubject();
}
