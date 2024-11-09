import 'dart:convert';

class ProfileUpdateModel{
  final int ID;
  final String phone;
  final int age;
  final String profile;
  final String gender;

  ProfileUpdateModel( {
    required this.ID, required this.age, required this.gender,
    required this.phone,
    required this.profile,
    });

  factory ProfileUpdateModel.fromMap(Map<String,dynamic> json)
  {
    return ProfileUpdateModel(
        ID: json['ID'],
        age: json['age'],
        gender: json['gender'],
        phone: json['phone'],
        profile: json['profile']
    );
  }
  Map<String,dynamic> toMap()=>{
    "ID":ID,
    "phone" : phone,
    "profile": profile,
    "age": age,
    "gender" : gender
  };

  String toJson()=> jsonEncode(toMap());
  factory ProfileUpdateModel.fromJson(String source)=> ProfileUpdateModel.fromMap(jsonDecode(source));

}