class UserEntite {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String rePassword;

  UserEntite(
      {required this.username,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.password,
      required this.rePassword});
}
