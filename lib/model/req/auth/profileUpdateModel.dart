import 'dart:convert';

class ProfileUpdateModel{
  final int ID;
  final String phone;
  final int age;
  final String? profile;
  final String gender;
  final String role;
  final bool isUpdatedProfile;

  ProfileUpdateModel( {required this.isUpdatedProfile, required this.role,
    required this.ID, required this.age, required this.gender,
    required this.phone,
    this.profile,
    });

  factory ProfileUpdateModel.fromMap(Map<String,dynamic> json)
  {
    return ProfileUpdateModel(
        ID: json['ID'],
        age: json['age'],
        gender: json['gender'],
        phone: json['phone'],
        profile: json['profile'],
        role: json['role'],
        isUpdatedProfile: json['isUpdateProfile']
    );
  }
  Map<String,dynamic> toMap()=>{
    "ID":ID,
    "phone" : phone,
    "profile": profile,
    "age": age,
    "gender" : gender,
    "role": role,
    "isUpdateProfile": isUpdatedProfile
  };

  String toJson()=> jsonEncode(toMap());
  factory ProfileUpdateModel.fromJson(String source)=> ProfileUpdateModel.fromMap(jsonDecode(source));

}