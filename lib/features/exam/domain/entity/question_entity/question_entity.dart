import 'package:exam_app/features/exam/domain/entity/question_entity/answer_entity.dart';

class QuestionEntity {
  List<AnswerEntity>? listOfAnswer;
  String? type;
  String? id;
  String? question;
  String? correct;
  String?titleOfExam;
  QuestionEntity(
      {this.listOfAnswer, this.correct, this.id, this.question, this.type,this.titleOfExam});
}
