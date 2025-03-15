import 'package:exam_app/config/appColor.dart';
import 'package:exam_app/features/exam/presentation/view_model/cubit/exam_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final examHomeView = BlocProvider.of<ExamViewModelCubit>(context);
    final ans = examHomeView.checkTheScore();

    print('the ans is $ans');
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Score'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Score', style: theme.bodyLarge),
            SizedBox(height: 20.h),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeAlign: 5,
                        strokeWidth: 20,
                        value: ans.$1 / examHomeView.numberOfQuestion,
                        backgroundColor: AppColor.redError,
                        semanticsValue:
                            '${ans.$1 / examHomeView.numberOfQuestion}%',
                        semanticsLabel:
                            '${ans.$1 / examHomeView.numberOfQuestion}%',
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        title: Text('Correct',
                            style: theme.bodyMedium!
                                .copyWith(color: AppColor.blueBase)),
                        trailing: Container(
                          width: 20.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColor.blueBase)),
                          child: Center(
                            child: Text(
                              '${ans.$1}',
                              style: theme.bodySmall!
                                  .copyWith(color: AppColor.blueBase),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text('InCorrect',
                            style: theme.bodyMedium!
                                .copyWith(color: AppColor.redError)),
                        trailing: Container(
                          width: 20.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColor.redError)),
                          child: Center(
                            child: Text(
                              '${ans.$2}',
                              style: theme.bodySmall!
                                  .copyWith(color: AppColor.redError),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Show Results',
                      style:
                          theme.bodyMedium!.copyWith(color: AppColor.white))),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: AppColor.blueBase),
                    backgroundColor: AppColor.white,
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Text('Start again',
                      style: theme.bodyMedium!
                          .copyWith(color: AppColor.blueBase))),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
