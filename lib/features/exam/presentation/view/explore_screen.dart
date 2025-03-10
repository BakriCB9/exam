import 'package:exam_app/config/appColor.dart';
import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/core/widgets/cash_network_widget.dart';
import 'package:exam_app/features/exam/presentation/view_model/cubit/exam_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final examHomeView = getIt.get<ExamViewModelCubit>();
  @override
  void initState() {
    examHomeView.getAllSubject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.white,
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
            bloc: examHomeView,
            builder: (context, state) {
              if (state.isLoading == true) {
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
                    children: state.list!
                        .map((item) => Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Card(
                                color: Colors.white,
                                elevation: 3,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 20),
                                  child: ListTile(
                                    leading:
                                        CustomCachImage(imageurl: item.icon!),
                                    title: Text(
                                      item.name!,
                                      style: theme.bodyMedium,
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
