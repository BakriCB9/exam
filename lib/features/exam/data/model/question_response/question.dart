import 'package:exam_app/features/exam/domain/entity/question_entity/answer_entity.dart';
import 'package:exam_app/features/exam/domain/entity/question_entity/question_entity.dart';

import 'answer.dart';
import 'exam.dart';
import 'subject.dart';

class Question {
  List<Answers>? answers;
  String? type;
  String? id;
  String? question;
  String? correct;
  Subject? subject;
  Exam? exam;
  DateTime? createdAt;

  Question({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        answers: (json['answers'] as List<dynamic>?)
            ?.map((e) => Answers.fromJson(e as Map<String, dynamic>))
            .toList(),
        type: json['type'] as String?,
        id: json['_id'] as String?,
        question: json['question'] as String?,
        correct: json['correct'] as String?,
        subject: json['subject'] == null
            ? null
            : Subject.fromJson(json['subject'] as Map<String, dynamic>),
        exam: json['exam'] == null
            ? null
            : Exam.fromJson(json['exam'] as Map<String, dynamic>),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'answers': answers?.map((e) => e.toJson()).toList(),
        'type': type,
        '_id': id,
        'question': question,
        'correct': correct,
        'subject': subject?.toJson(),
        'exam': exam?.toJson(),
        'createdAt': createdAt?.toIso8601String(),
      };
  List<AnswerEntity> _listOfAnswerEntity() {
    final list = answers?.map((e) {
      return e.toAnswerEntity();
    }).toList();
    return list!;
  }

  QuestionEntity toQuestionEntity() {
    return QuestionEntity(
        listOfAnswer: _listOfAnswerEntity(),
        titleOfExam: this.exam!.title,
        correct: this.correct,
        question: this.question,
        type: this.type);
  }
}
