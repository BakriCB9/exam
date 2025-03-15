import 'package:exam_app/config/appColor.dart';
import 'package:exam_app/core/routes_manager/routes_name.dart';
import 'package:exam_app/core/widgets/cash_network_widget.dart';
import 'package:exam_app/features/exam/presentation/view_model/cubit/exam_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  //final examHomeView = getIt.get<ExamViewModelCubit>();
  @override
  void initState() {
    //examHomeView.getAllSubject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ExamViewModelCubit>(context).getAllSubject();
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: Text(
          'Survey',
          style: theme.labelLarge,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: BlocBuilder<ExamViewModelCubit, ExamViewModelState>(
            builder: (context, state) {
              if (state.isLoadingAllSubject == true) {
                return Center(child: CircularProgressIndicator());
              }
              if (state.error != null) {
                return Center(
                  child: Text(
                    'Failed to get element',
                    style: theme.bodyMedium,
                  ),
                );
              }
              return ListView(
                children: [
                  Text(
                    'Browse by subject',
                    style: theme.bodyLarge,
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: state.listAllSubject!
                        .map((item) => Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  BlocProvider.of<ExamViewModelCubit>(context)
                                      .getAllExamOnSubject(item.id!);
                                  // examHomeView.getAllExamOnSubject(item.id!);
                                  Navigator.of(context).pushNamed(
                                      Routes.examSubjectScreen,
                                      arguments: {'title': item.name!});
                                },
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 20),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 35.w,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(35.r),
                                            child: CustomCachImage(
                                                imageurl: item.icon!),
                                          )),
                                      title: Text(
                                        item.name!,
                                        style: theme.bodyMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  )
                ],
              );
            },
          )),
    );
  }
}
