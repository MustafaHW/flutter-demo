class LoginUser {
  late String email;
  late String password;
  LoginUser({required this.email, required this.password});
  LoginUser.fromJSON(Map<String, dynamic> json) {
    email = json["email"];
    password = json["password"];
  }
  Map<String, dynamic> toJSON() => {"email": email, "password": password};
}
