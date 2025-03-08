class ShowDataEntity {
  final String id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  ShowDataEntity({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  // Factory constructor for creating an instance from JSON
  factory ShowDataEntity.fromJson(Map<String, dynamic> json) {
    final user = json['user'] as Map<String, dynamic>; // Access the nested user object
    return ShowDataEntity(
      id: user['_id'] ?? '',
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