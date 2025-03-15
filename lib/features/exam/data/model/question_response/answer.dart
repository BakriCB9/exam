import 'package:exam_app/features/exam/domain/entity/question_entity/answer_entity.dart';

class Answers {
  String? answer;
  String? key;

  Answers({this.answer, this.key});

  Answers.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['key'] = this.key;
    return data;
  }

  AnswerEntity toAnswerEntity() {
    return AnswerEntity(answer: this.answer, key: this.key!);
  }
}
