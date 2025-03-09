import 'metadata.dart';
import 'subject.dart';

class AllSubject {
  String? message;
  Metadata? metadata;
  List<Subject>? subjects;

  AllSubject({this.message, this.metadata, this.subjects});

  factory AllSubject.fromJson(Map<String, dynamic> json) => AllSubject(
        message: json['message'] as String?,
        metadata: json['metadata'] == null
            ? null
            : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
        subjects: (json['subjects'] as List<dynamic>?)
            ?.map((e) => Subject.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'metadata': metadata?.toJson(),
        'subjects': subjects?.map((e) => e.toJson()).toList(),
      };
}
