import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/exam/domain/entity/question_entity/question_entity.dart';
import 'package:exam_app/features/exam/domain/repo/exam_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllQuestionUseCase {
  ExamRepo examRepo;
  GetAllQuestionUseCase(this.examRepo);
  Future<ApiResult<List<QuestionEntity>>> call(String idExam) {
    return examRepo.getAllQuestionOfExam(idExam);
  }
}
