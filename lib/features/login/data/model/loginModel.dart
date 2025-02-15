class LoginRequestModel {
  final String email;
  final String password;
  LoginRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, String> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
