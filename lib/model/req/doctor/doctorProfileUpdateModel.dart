import 'dart:convert';

class DoctorProfileUpdateModel{
  // final int ID;
  final String name;
  final String email;
  final String specialist;
  final String? description;
  final String? profile;
  final String? signature;
  // final String gender;
  final String role;
  final bool isUpdatedProfile;
  final String? publicID;

  DoctorProfileUpdateModel( { required this.name, required this.email,
    required this.specialist, this.description, this.signature,
    required this.isUpdatedProfile, required this.role,
    this.profile,
    this.publicID,
    });

  factory DoctorProfileUpdateModel.fromMap(Map<String,dynamic> json)
  {
    return DoctorProfileUpdateModel(
        // ID: json['ID'],
        name: json['name'],
        email: json['email'],
        specialist: json['specialist'],
        description: json['description']??'',
        profile: json['profile'],
        signature: json['signature'],
        role: json['role'],
        isUpdatedProfile: json['isUpdateProfile'],
        publicID: json['publicId']
    );
  }
  Map<String,dynamic> toMap()=>{
    "name" : name,
    "email" : email,
    "specialist" : specialist,
    'description': description??'',
    "profile": profile??'',
    "signature": signature??'',
    "role": role,
    "isUpdateProfile": isUpdatedProfile,
    "publicId": publicID
  };

  String toJson()=> jsonEncode(toMap());
  factory DoctorProfileUpdateModel.fromJson(String source)=> DoctorProfileUpdateModel.fromMap(jsonDecode(source));

}