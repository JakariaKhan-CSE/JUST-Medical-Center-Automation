// all doctor return korbe
import 'dart:convert';

// very useful when return  model list
List<DoctorResponse> doctorResponseFromJson(String str) => List<DoctorResponse>.from(json.decode(str).map((x) => DoctorResponse.fromJson(x)));
// single doctor return korbe
DoctorResponse singleDoctorResponseFromJson(String str) =>  DoctorResponse.fromJson(jsonDecode(str));// all doctor return korbe

class DoctorResponse {
  List<TotalDoctors>? totalDoctors;

  DoctorResponse({this.totalDoctors});

  DoctorResponse.fromJson(Map<String, dynamic> json) {
    if (json['totalDoctors'] != null) {
      totalDoctors = <TotalDoctors>[];
      json['totalDoctors'].forEach((v) {
        totalDoctors!.add(new TotalDoctors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.totalDoctors != null) {
      data['totalDoctors'] = this.totalDoctors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TotalDoctors {
  String? gender;
  String? sId;
  String? name;
  String? role;
  String? profile;
  String? iD;
  int? age;
  String? phone;

  TotalDoctors(
      {this.gender,
        this.sId,
        this.name,
        this.role,
        this.profile,
        this.iD,
        this.age,
        this.phone});

  TotalDoctors.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    sId = json['_id'];
    name = json['name'];
    role = json['role'];
    profile = json['profile'];
    iD = json['ID'];
    age = json['age'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['role'] = this.role;
    data['profile'] = this.profile;
    data['ID'] = this.iD;
    data['age'] = this.age;
    data['phone'] = this.phone;
    return data;
  }
}
