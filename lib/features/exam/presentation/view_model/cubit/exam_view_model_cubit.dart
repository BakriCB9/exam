import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/exam/domain/entity/subject_entity.dart/subject_entity.dart';
import 'package:exam_app/features/exam/domain/usecase/get_all_subject_usecase.dart';
import 'package:injectable/injectable.dart';

part 'exam_view_model_state.dart';

@injectable
class ExamViewModelCubit extends Cubit<ExamViewModelState> {
  ExamViewModelCubit(this._getAllSubjectUsecase) : super(ExamViewModelState());
  GetAllSubjectUsecase _getAllSubjectUsecase;
  getAllSubject() async {
    emit(state.copyWith(isloading: true));
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
}
