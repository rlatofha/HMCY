class User{
  late String email;
  late String password;
  late String nickname;
  
  User({
      required this.email,  required this.password, required this.nickname
  });

  User.fromMap(Map<String, dynamic> res)
    :
        email = res["email"],
        password = res["password"],
        nickname = res["nickname"];
       
  Map<String, Object?> toMap() {
    return {
      'email': email,
      'password': password,
      'nickname': nickname
    };
  }

}