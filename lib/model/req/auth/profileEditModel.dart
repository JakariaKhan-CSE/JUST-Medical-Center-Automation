import 'dart:convert';

class ProfileEditModel{
  final int ID;
  final String phone;
  final int age;
  final String? profile;
  final String gender;
  final String? publicID;


  ProfileEditModel( {
    required this.ID, required this.age, required this.gender,
    required this.phone,
    this.profile,
    this.publicID
  });

  factory ProfileEditModel.fromMap(Map<String,dynamic> json)
  {
    return ProfileEditModel(
        ID: json['ID'],
        age: json['age'],
        gender: json['gender'],
        phone: json['phone'],
        profile: json['profile'],
      publicID: json['publicId']??'',

    );
  }
  Map<String,dynamic> toMap()=>{
    "ID":ID,
    "phone" : phone,
    "profile": profile,
    "age": age,
    "gender" : gender,
    "publicID": publicID??''
  };

  String toJson()=> jsonEncode(toMap());
  factory ProfileEditModel.fromJson(String source)=> ProfileEditModel.fromMap(jsonDecode(source));

}