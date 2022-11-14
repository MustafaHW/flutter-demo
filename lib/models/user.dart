// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String? id;
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? birthday;
  final String? token;

  User(
      {this.id,
      this.email,
      this.password,
      this.firstName,
      this.lastName,
      this.gender,
      this.birthday,
      this.token});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      "email": email,
      "password": password,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'birthday': birthday,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      birthday: map['birthday'] != null ? map['birthday'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
