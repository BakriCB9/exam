part of 'exam_view_model_cubit.dart';

class ExamViewModelState extends Equatable {
  const ExamViewModelState({
     this.isLoading,
     this.list,
     this.error,
  });
  final List<AllSubjectEntity>? list;
  final bool? isLoading;
  final String? error;
  ExamViewModelState copyWith(
      {List<AllSubjectEntity>? list, bool? isloading, String? error}) {
    return ExamViewModelState(
        list: list ?? this.list,
        isLoading: isloading ?? this.isLoading,
        error: error ?? this.error);
  }

  @override
   List<Object?> get props => [list, isLoading, error];
}
