import 'package:exam_app/config/appColor.dart';
import 'package:exam_app/features/exam/domain/entity/question_entity/answer_entity.dart';
import 'package:exam_app/features/exam/presentation/view_model/cubit/exam_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSelectAnswerWidget extends StatefulWidget {
  final List<AnswerEntity> list;
  final int indexOfQuestion;
  final String correctAnswer;
  final String idOfQuestion;
  const CustomSelectAnswerWidget(
      {required this.idOfQuestion,
      required this.correctAnswer,
      required this.indexOfQuestion,
      required this.list,
      super.key});

  @override
  State<CustomSelectAnswerWidget> createState() =>
      _CustomSelectAnswerWidgetState();
}

class _CustomSelectAnswerWidgetState extends State<CustomSelectAnswerWidget>
    with AutomaticKeepAliveClientMixin {
  String isSelectedAnswer = '';

  @override
  Widget build(BuildContext context) {
    final examViewModel = BlocProvider.of<ExamViewModelCubit>(context);
    super.build(context);
    return Column(
        children: widget.list.map((item) {
      return Card(
        elevation: 0,
        margin: EdgeInsets.only(bottom: 15.h),
        color:
            isSelectedAnswer == item.key ? AppColor.blue10 : AppColor.lightBlue,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Row(
            children: [
              Radio(
                  activeColor: AppColor.blueBase,
                  value: item.key,
                  groupValue: isSelectedAnswer,
                  onChanged: (value) {
                    setState(() {
                      isSelectedAnswer = value!;

                      if (isSelectedAnswer == widget.correctAnswer) {
                        examViewModel
                            .numberOfCorrectAnswer[widget.idOfQuestion] = 1;
                      } else if (isSelectedAnswer != widget.correctAnswer ||
                          isSelectedAnswer == '') {
                        examViewModel
                            .numberOfCorrectAnswer[widget.idOfQuestion] = 0;
                      }
                    });
                  }),
              Expanded(
                child: Text(item.answer!),
              )
            ],
          ),
        ),
      );
    }).toList());
  }

  @override
  bool get wantKeepAlive => true;
}
