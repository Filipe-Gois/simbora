// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String email;
  final String password;
  final String profilePicture;
  User({
    required this.email,
    required this.password,
    required this.profilePicture,
  });

  User copyWith({
    String? email,
    String? password,
    String? profilePicture,
  }) {
    return User(
      email: email ?? this.email,
      password: password ?? this.password,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'profilePicture': profilePicture,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      password: map['password'] as String,
      profilePicture: map['profilePicture'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'User(email: $email, password: $password, profilePicture: $profilePicture)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.password == password &&
        other.profilePicture == profilePicture;
  }

  @override
  int get hashCode =>
      email.hashCode ^ password.hashCode ^ profilePicture.hashCode;
}
