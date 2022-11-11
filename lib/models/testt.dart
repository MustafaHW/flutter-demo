class Testt {
  Testt({
    required this.id,
    // required this.name,
    // required this.username,
    // required this.email,
    // required this.phone,
    // required this.website,
  });
  int id;
  // String name;
  // String username;
  // String email;
  // // Address address;
  // String phone;
  // String website;
  factory Testt.fromJson(Map<String, dynamic> json) => Testt(
        id: json['id'],
        // name: json['name'],
        // username: json['username'],
        // email: json['email'],
        // phone: json['phone'],
        // website: json['website'],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        // "name": name,
        // "username": username,
        // "email": email,
        // "phone": phone,
        // "website": website,
      };
}
