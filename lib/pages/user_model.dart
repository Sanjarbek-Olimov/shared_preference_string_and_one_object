class User {
  String? id;
  String? email;
  String? password;

  User({this.id, this.email, this.password});

  User.from({this.email, this.password});

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        email = json["email"],
        password = json["password"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
      };

  @override
  String toString() {
    // TODO: implement toString
    return "id: $id, email: $email, password: $password";
  }
}
