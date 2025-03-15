import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/exam/data/model/save_result/save_result_local.dart';
import 'package:exam_app/features/exam/domain/entity/exam_entity/all_exam_of_one_subject.dart';
import 'package:exam_app/features/exam/domain/entity/question_entity/question_entity.dart';
import 'package:exam_app/features/exam/domain/entity/subject_entity/subject_entity.dart';
import 'package:exam_app/features/exam/domain/usecase/get_all_exam_on_subject.dart';
import 'package:exam_app/features/exam/domain/usecase/get_all_question.dart';
import 'package:exam_app/features/exam/domain/usecase/get_all_subject_usecase.dart';
import 'package:exam_app/features/exam/domain/usecase/save_answers_local.dart';
import 'package:injectable/injectable.dart';

part 'exam_view_model_state.dart';

@injectable
class ExamViewModelCubit extends Cubit<ExamViewModelState> {
  ExamViewModelCubit(this._getAllQuestionUseCase, this._getAllSubjectUsecase,
      this._getAllExamOnSubjectUseCase, this._saveAnswersLocalUseCase)
      : super(ExamViewModelState());
  SaveAnswersLocalUseCase _saveAnswersLocalUseCase;
  GetAllSubjectUsecase _getAllSubjectUsecase;
  GetAllExamOnSubjectUseCase _getAllExamOnSubjectUseCase;
  GetAllQuestionUseCase _getAllQuestionUseCase;
  Map<String, dynamic> numberOfCorrectAnswer = Map();
   int numberOfQuestion = 0;
  // int durationOfExam=0;
  // String titleOfExam='';
  // List<SaveResultLocal>list=[];

  getAllSubject() async {
    emit(state.copyWith(isloading: true, error: null));
    ApiResult<List<AllSubjectEntity>> result = await _getAllSubjectUsecase();
    switch (result) {
      case SuccessApiResult():
        {
          emit(state.copyWith(list: result.data, isloading: false));
        }
      case ErrorApiResult():
        {
          emit(state.copyWith(
              error: result.exception.toString(), isloading: false));
        }
    }
  }

  getAllExamOnSubject(String idOfsubject) async {
    emit(state.copyWith(isLoadingAllExam: true, errorAllExam: null));
    ApiResult<List<AllExamOfOneSubjectEntity>> result =
        await _getAllExamOnSubjectUseCase(idOfsubject);
    switch (result) {
      case SuccessApiResult():
        {
          emit(state.copyWith(
              listAllexam: result.data, isLoadingAllExam: false));
        }
      case ErrorApiResult():
        {
          emit(state.copyWith(
              errorAllExam: result.exception.toString(),
              isLoadingAllExam: false));
        }
    }
  }

  saveAnswerLocal() {}

  getAllQuestionOfExam(String idEexam) async {
    emit(state.copyWith(isLoadingQuestion: true, errorQuestion: null));
    ApiResult<List<QuestionEntity>> ans = await _getAllQuestionUseCase(idEexam);
    switch (ans) {
      case SuccessApiResult():
        {
          emit(state.copyWith(
              isLoadingQuestion: false, listOfQuestions: ans.data));
        }
      case ErrorApiResult():
        {
          emit(state.copyWith(
              isLoadingQuestion: false,
              errorQuestion: ans.exception.toString()));
        }
    }
  }

  saveAnswer(Map<String, dynamic> answer) async {
    await _saveAnswersLocalUseCase(answer);
  }

  (int, int) checkTheScore() {
    int correctAns = 0;

    for (int answer in numberOfCorrectAnswer.values) {
      correctAns += answer;
    }

    return (correctAns, numberOfQuestion - correctAns);
  }
}
