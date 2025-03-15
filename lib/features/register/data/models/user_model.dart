import 'package:exam_app/features/register/domain/entite/user_entite.dart';

class UserModel extends UserEntite {
  UserModel({
    required super.username,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phone,
    required super.password,
    required super.rePassword,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      rePassword: json['rePassword'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'password': password,
      'rePassword': rePassword,
    };
  }
}
