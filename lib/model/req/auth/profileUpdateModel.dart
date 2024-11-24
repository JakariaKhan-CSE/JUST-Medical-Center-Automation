import 'dart:convert';

class ProfileUpdateModel{
  final int ID;
  final String phone;
  final int age;
  final String? profile;
  final String gender;
  final String role;
  final bool isUpdatedProfile;
  final String? publicID;

  ProfileUpdateModel( {required this.isUpdatedProfile, required this.role,
    required this.ID, required this.age, required this.gender,
    required this.phone,
    this.profile,
    this.publicID,
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
        isUpdatedProfile: json['isUpdateProfile'],
        publicID: json['publicId']
    );
  }
  Map<String,dynamic> toMap()=>{
    "ID":ID,
    "phone" : phone,
    "profile": profile,
    "age": age,
    "gender" : gender,
    "role": role,
    "isUpdateProfile": isUpdatedProfile,
    "publicId": publicID
  };

  String toJson()=> jsonEncode(toMap());
  factory ProfileUpdateModel.fromJson(String source)=> ProfileUpdateModel.fromMap(jsonDecode(source));

}