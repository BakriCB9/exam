import 'package:exam_app/config/appColor.dart';
import 'package:exam_app/core/routes_manager/routes_name.dart';
import 'package:exam_app/features/exam/presentation/view/widget/custom_select_answer_widget.dart';
import 'package:exam_app/features/exam/presentation/view/widget/time_notifier.dart';
import 'package:exam_app/features/exam/presentation/view_model/cubit/exam_view_model_cubit.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class QuestionScreen extends StatefulWidget {
  final int durationOfExam;
  const QuestionScreen({required this.durationOfExam, super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late PageController controllerPage;
  ValueNotifier currentPage = ValueNotifier<int>(0);
  late GlobalKey<TimerNotifierWidgetState> _keyOftime;
  @override
  void initState() {
    _keyOftime = GlobalKey<TimerNotifierWidgetState>();
    controllerPage = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final examViewModel = BlocProvider.of<ExamViewModelCubit>(context);
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                //   _keyOftime.currentState?.timer.cancel();
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
          title: Text('Exam'),
          actions: [
            Row(children: [
              Image.asset('asset/images/time_image.png'),
              SizedBox(width: 5.w),
              TimerNotifierWidget(
                timeOfExam: widget.durationOfExam,
                key: _keyOftime,
              ),
              SizedBox(width: 10.h)
            ])
          ]),
      body: BlocBuilder<ExamViewModelCubit, ExamViewModelState>(
        builder: (context, state) {
          if (state.isLoadingAllQuestion == true) {
            return Center(child: CircularProgressIndicator());
          } else if (state.error != null) {
            return Center(
              child: Text('failed to get Questions try again'),
            );
          }
          {
            if (state.listOfAllQuestion!.isEmpty) {
              return Column(
                children: [
                  Lottie.asset('asset/jsonLottie/empty_question.json'),
                  Text(
                    'No questions add to this exam yet\n try another time',
                    textAlign: TextAlign.center,
                    style: theme.bodyMedium!.copyWith(color: AppColor.blueBase),
                  )
                ],
              );
            } else {
              examViewModel.numberOfQuestion = state.listOfAllQuestion!.length;
              _keyOftime.currentState!.startTime();

              return Column(
                children: [
                  ValueListenableBuilder(
                      valueListenable: currentPage,
                      builder: (context, _, __) {
                        return Column(
                          children: [
                            Text(
                              'Question ${currentPage.value + 1} of ${state.listOfAllQuestion?.length}',
                              style: theme.bodySmall!
                                  .copyWith(color: AppColor.grey),
                            ),
                            SizedBox(height: 10.h),
                            LinearProgressIndicator(
                              color: AppColor.blueBase,
                              backgroundColor: AppColor.black10,
                              value: (currentPage.value + 1) /
                                  state.listOfAllQuestion?.length,
                            ),
                          ],
                        );
                      }),
                  SizedBox(height: 10.h),
                  ExpandablePageView.builder(
                    controller: controllerPage,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      // _keyOftime.currentState!.startTime();
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            Text(
                              state.listOfAllQuestion![index].question!,
                              style: theme.bodyMedium,
                            ),
                            SizedBox(height: 10.h),
                            CustomSelectAnswerWidget(
                                idOfQuestion:
                                    state.listOfAllQuestion![index].question!,
                                correctAnswer:
                                    state.listOfAllQuestion![index].correct!,
                                indexOfQuestion: index,
                                list: state
                                    .listOfAllQuestion![index].listOfAnswer!),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      );
                    },
                    itemCount: state.listOfAllQuestion!.length,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: AppColor.white,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: AppColor.blueBase),
                                          borderRadius:
                                              BorderRadius.circular(10.r))),
                                  onPressed: () {
                                    if (currentPage.value == 0) {
                                      //  _keyOftime.currentState?.timer.cancel();
                                      Navigator.of(context).pop();
                                    } else {
                                      currentPage.value--;
                                      controllerPage.animateToPage(
                                          currentPage.value,
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.linear);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Text(
                                      'Back',
                                      style: theme.bodyMedium!
                                          .copyWith(color: AppColor.blueBase),
                                    ),
                                  )),
                            ),
                            SizedBox(width: 10.h),
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    if (currentPage.value ==
                                        state.listOfAllQuestion!.length - 1) {
                                      Navigator.of(context)
                                          .pushNamed(Routes.scoreScreen);
                                      examViewModel.saveAnswer(
                                          examViewModel.numberOfCorrectAnswer);
                                    } else {
                                      currentPage.value++;
                                      controllerPage.animateToPage(
                                          currentPage.value,
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.linear);
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 10.h),
                                    child: Text(
                                      'Next',
                                      style: theme.bodyMedium!
                                          .copyWith(color: AppColor.white),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          }
        },
      ),
    );
  }
}
