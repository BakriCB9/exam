import 'package:exam_app/features/exam/data/model/all_subject/all_subject.dart';

abstract class RemoteDatasourceExam {
  Future<AllSubject> getAllSubject();
}
