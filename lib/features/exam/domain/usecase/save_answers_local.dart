import 'package:exam_app/features/exam/domain/repo/exam_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveAnswersLocalUseCase {
  ExamRepo examRepo;
  SaveAnswersLocalUseCase(this.examRepo);
  Future<void> call(Map<String, dynamic> answers) =>
      examRepo.saveAnswer(answers);
}
