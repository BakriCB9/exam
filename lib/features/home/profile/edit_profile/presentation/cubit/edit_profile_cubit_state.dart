import 'package:equatable/equatable.dart';

import '../../domain/entities/show_data_entite.dart';

enum StatusEditProfile { loading, success, error }

class EditProfileState extends Equatable {
  const EditProfileState(
      {required this.status,
      this.error,
        this.profileData,

      });
  final StatusEditProfile status;
  final String? error;
  final ShowDataEntity? profileData; // Add this line


  EditProfileState copyWith({
    String? successMessage,
    String? error,
    StatusEditProfile? status,
    ShowDataEntity? profileData,

  }) {
    return EditProfileState(
        error: error ?? this.error,
        status: status ?? this.status,
      profileData: profileData ?? this.profileData,
    );

  }
  @override
  List<Object?> get props => [ error, status];
}
