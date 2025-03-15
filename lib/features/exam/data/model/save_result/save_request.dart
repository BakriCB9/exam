import 'package:exam_app/features/exam/data/model/save_result/save_result_local.dart';

class SaveRequest {
  List<SaveResultLocal>? ListOfResult;
  int? numberOfCorrctAnswer;
  int? numberOfQuestion;
  int? durationOfExam;
  int? titleOfexam;
  SaveRequest({
    this.ListOfResult,
    this.durationOfExam,
    this.numberOfCorrctAnswer,
    this.numberOfQuestion,
    this.titleOfexam,
  });
  Map<String ,dynamic>toJson(){
    return {};
  }
}
