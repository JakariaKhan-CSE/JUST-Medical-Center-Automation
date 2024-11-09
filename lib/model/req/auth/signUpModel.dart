import 'dart:convert';

class SignUpModel{
  final String username;
  final String email;
  final String password;
  final String role;

  SignUpModel( {required this.role,required this.email, required this.password,required this.username});

  factory SignUpModel.fromMap(Map<String,dynamic> json)
  {
    return SignUpModel(
        username: json['name'],
        email: json['email'],
        password: json['password'],
        role: json['role']
    );
  }
  Map<String,dynamic> toMap()=>{
    "name":username,
    "email":email,
    "password": password,
    "role": role  // only patient can register(by default patient)
  };

  String toJson()=> jsonEncode(toMap());
  factory SignUpModel.fromJson(String source)=> SignUpModel.fromMap(jsonDecode(source));

}