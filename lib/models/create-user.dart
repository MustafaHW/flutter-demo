class CreateUser {
  late String email;
  late String password;
  late String firstName;
  late String lastName;
  late String? gender;
  late String? birthday;
  CreateUser(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      this.gender,
      this.birthday});
}
