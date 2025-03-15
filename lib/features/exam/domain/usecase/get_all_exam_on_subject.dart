import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/exam/domain/entity/exam_entity/all_exam_of_one_subject.dart';
import 'package:exam_app/features/exam/domain/repo/exam_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllExamOnSubjectUseCase {
  ExamRepo examRepo;
  GetAllExamOnSubjectUseCase(this.examRepo);
  Future<ApiResult<List<AllExamOfOneSubjectEntity>>> call(String idOfSubject) =>
      examRepo.getAllExamOnSubject(idOfSubject);
}
