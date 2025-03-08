class ProfileEntity {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  ProfileEntity({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  // Factory constructor for creating an instance from JSON
  factory ProfileEntity.fromJson(Map<String, dynamic> json) {
    final user = json['user'] as Map<String, dynamic>; // Access the nested user object
    return ProfileEntity(
      username: user['username'] ?? '',
      firstName: user['firstName'] ?? '',
      lastName: user['lastName'] ?? '',
      email: user['email'] ?? '',
      phone: user['phone'] ?? '',
     );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
    };
  }
}