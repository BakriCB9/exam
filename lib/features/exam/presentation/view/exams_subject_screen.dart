import 'package:exam_app/config/appColor.dart';
import 'package:exam_app/core/routes_manager/routes_name.dart';
import 'package:exam_app/features/exam/presentation/view_model/cubit/exam_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamsSubjectScreen extends StatelessWidget {
  final String title;
  const ExamsSubjectScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<ExamViewModelCubit, ExamViewModelState>(
            builder: (context, state) {
          if (state.isLoadingAllExamOnSubject == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.errorAllExamOnSubject != null) {
            return Center(
              child: Text('Failed to get all Exam'),
            );
          }
          if (state.listAllExamOnSubject != null) {
            return ListView.builder(
                itemCount: state.listAllExamOnSubject!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.questionScreen);
                    },
                    child: InkWell(
                      ///note
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.questionScreen,
                            arguments: {
                              'durationOfexam':
                                  state.listAllExamOnSubject![index].duration
                            });
                        BlocProvider.of<ExamViewModelCubit>(context)
                            .getAllQuestionOfExam(
                                state.listAllExamOnSubject![index].id);
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            trailing: FittedBox(
                              alignment: Alignment.centerRight,
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '${state.listAllExamOnSubject![index].duration} Minutes ',
                                style: theme.labelSmall!
                                    .copyWith(color: AppColor.blueBase),
                              ),
                            ),
                            leading: CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  AssetImage('asset/images/profit.png'),
                            ),
                            title: FittedBox(
                              alignment: Alignment.centerLeft,
                              fit: BoxFit.scaleDown,
                              child: Text(
                                  '${state.listAllExamOnSubject![index].title}',
                                  style: theme.bodyMedium),
                            ),
                            subtitle: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${state.listAllExamOnSubject![index].numberOfQuestions} Question',
                                style: theme.bodySmall!
                                    .copyWith(color: AppColor.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
          return SizedBox();
        }),
      ),
    );
  }
}
