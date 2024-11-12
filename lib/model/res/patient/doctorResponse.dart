import 'dart:convert';

// see carefully very useful
// For parsing a JSON string into a list of `TotalDoctors` objects
List<TotalDoctors> totalDoctorsFromJson(String str) =>
    List<TotalDoctors>.from(json.decode(str)["totalDoctors"].map((x) => TotalDoctors.fromJson(x)));

class TotalDoctors {
  String? gender;
  String? sId;
  String? name;
  String? role;
  String? profile;
  String? iD;
  int? age;
  String? phone;
  String? specialist;

  TotalDoctors({
    this.gender,
    this.sId,
    this.name,
    this.role,
    this.profile,
    this.iD,
    this.age,
    this.phone,
    this.specialist
  });

  TotalDoctors.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    sId = json['_id'];
    name = json['name'];
    role = json['role'];
    profile = json['profile'];
    iD = json['ID'];
    age = json['age'];
    phone = json['phone'];
    specialist = json['specialist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gender'] = gender;
    data['_id'] = sId;
    data['name'] = name;
    data['role'] = role;
    data['profile'] = profile;
    data['ID'] = iD;
    data['age'] = age;
    data['phone'] = phone;
    data['specialist'] = specialist;
    return data;
  }
}
