class AnswerLocal {
  String? answer;
  String? key;
  AnswerLocal({this.answer, this.key});
  Map<String, dynamic> toJson() {
    return {'answer': answer, 'key': key};
  }
}
