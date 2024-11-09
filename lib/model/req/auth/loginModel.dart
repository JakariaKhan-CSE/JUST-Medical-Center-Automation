import 'dart:convert';

class LoginModel{
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});

  factory LoginModel.fromMap(Map<String,dynamic> json)
  {
    return LoginModel(
        email: json['email'],
        password: json['password']
    );
  }
  Map<String,dynamic> toMap()=>{
    "email":email,
    "password": password
  };

  String toJson()=> jsonEncode(toMap());
  factory LoginModel.fromJson(String source)=> LoginModel.fromMap(jsonDecode(source));

}