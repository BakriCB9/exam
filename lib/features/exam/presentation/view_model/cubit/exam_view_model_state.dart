part of 'exam_view_model_cubit.dart';

class ExamViewModelState extends Equatable {
  const ExamViewModelState(
      {this.isLoadingAllSubject,
      this.listAllSubject,
      this.error,
      this.errorAllExamOnSubject,
      this.isLoadingAllExamOnSubject,
      this.listAllExamOnSubject,
      this.listOfAllQuestion,
      this.errorAllQuestion,
      this.isLoadingAllQuestion});
  final List<QuestionEntity>? listOfAllQuestion;
  final List<AllSubjectEntity>? listAllSubject;
  final bool? isLoadingAllSubject;
  final bool? isLoadingAllQuestion;
  final String? errorAllQuestion;
  final String? error;
  final String? errorAllExamOnSubject;
  final bool? isLoadingAllExamOnSubject;
  final List<AllExamOfOneSubjectEntity>? listAllExamOnSubject;
  ExamViewModelState copyWith(
      {List<AllSubjectEntity>? list,
      bool? isloading,
      bool? isLoadingQuestion,
      String? errorQuestion,
      String? error,
      String? errorAllExam,
      bool? isLoadingAllExam,
      List<QuestionEntity>? listOfQuestions,
      List<AllExamOfOneSubjectEntity>? listAllexam}) {
    return ExamViewModelState(
        isLoadingAllQuestion: isLoadingQuestion ?? this.isLoadingAllQuestion,
        errorAllQuestion: errorQuestion ?? this.errorAllQuestion,
        listOfAllQuestion: listOfQuestions ?? this.listOfAllQuestion,
        listAllSubject: list ?? this.listAllSubject,
        isLoadingAllSubject: isloading ?? this.isLoadingAllSubject,
        error: error ?? this.error,
        errorAllExamOnSubject: errorAllExam ?? this.errorAllExamOnSubject,
        listAllExamOnSubject: listAllexam ?? this.listAllExamOnSubject,
        isLoadingAllExamOnSubject:
            isLoadingAllExam ?? this.isLoadingAllExamOnSubject);
  }

  @override
  List<Object?> get props => [
        isLoadingAllQuestion,
        errorAllQuestion,
        listAllSubject,
        isLoadingAllSubject,
        listOfAllQuestion,
        error,
        errorAllExamOnSubject,
        isLoadingAllExamOnSubject,
        listAllExamOnSubject
      ];
}
