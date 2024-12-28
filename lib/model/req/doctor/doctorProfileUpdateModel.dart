import 'dart:convert';

class DoctorProfileUpdateModel{
  // final int ID;
  final String name;
  // final String email;
  final String specialist;
  final String? description;
  final String? profile;
  final String? signature;
  // final String gender;
  final String? role;
  final bool? isUpdatedProfile;
  final String? profilePublicID;
  final String? signaturePublicID;

  DoctorProfileUpdateModel( { required this.name,
    required this.specialist, this.description, this.signature,
    this.isUpdatedProfile, this.role,
    this.profile,
    this.profilePublicID, this.signaturePublicID,
  });

  factory DoctorProfileUpdateModel.fromMap(Map<String,dynamic> json)
  {
    return DoctorProfileUpdateModel(
        // ID: json['ID'],
        name: json['name'],

        specialist: json['specialist'],
        description: json['description']??'',
        profile: json['profile'],
        signature: json['signature'],
        role: json['role'],
        isUpdatedProfile: json['isUpdateProfile'],
        profilePublicID: json['profilePublicId'],
      signaturePublicID: json['signaturePublicId']
    );
  }
  Map<String,dynamic> toMap()=>{
    "name" : name,

    "specialist" : specialist,
    'description': description??'',
    "profile": profile??'',
    "signature": signature??'',
    "role": role,
    "isUpdateProfile": isUpdatedProfile,
    "profilePublicId": profilePublicID,
    'signaturePublicId': signaturePublicID
  };

  String toJson()=> jsonEncode(toMap());
  factory DoctorProfileUpdateModel.fromJson(String source)=> DoctorProfileUpdateModel.fromMap(jsonDecode(source));

}