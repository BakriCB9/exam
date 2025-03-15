import 'package:exam_app/features/exam/data/model/save_result/answer_local.dart';

class SaveResultLocal {
  List<AnswerLocal>? listOfAnswer;
  String? selectAnswer;
  String? correctAnswer;
  
  SaveResultLocal({this.correctAnswer, this.listOfAnswer, this.selectAnswer});
  Map<String, dynamic> toJson() {
    return {
      'listOfAnswer': listOfAnswer?.map((item) {
        return item.toJson();
      }).toList(),
      'selectAnswer': selectAnswer,
      'correctAnswer': correctAnswer
    };
  }
}
