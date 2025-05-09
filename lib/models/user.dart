class User {
  final String username;
  final String phone;
  final String email;
  final String gender;

  User({
    required this.username,
    required this.phone,
    required this.email,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'phone': phone,
      'email': email,
      'gender': gender,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      phone: json['phone'],
      email: json['email'],
      gender: json['gender'],
    );
  }
}
