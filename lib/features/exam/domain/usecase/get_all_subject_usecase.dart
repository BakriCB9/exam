import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/exam/domain/entity/subject_entity/subject_entity.dart';
import 'package:exam_app/features/exam/domain/repo/exam_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllSubjectUsecase {
  final ExamRepo examRepo;
  const GetAllSubjectUsecase(this.examRepo);
  Future<ApiResult<List<AllSubjectEntity>>> call() => examRepo.getAllSubject();
}
