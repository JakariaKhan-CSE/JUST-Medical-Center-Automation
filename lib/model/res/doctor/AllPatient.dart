
import 'dart:convert';

List<allPatient> allPatientFromJson(String str) =>
    List<allPatient>.from(json.decode(str).map((x) => allPatient.fromJson(x)));

class allPatient {
  String? sId;
  String? name;
  String? gender;
  String? profile;
  String? iD;
  int? age;

  allPatient(
      {this.sId, this.name, this.gender, this.profile, this.iD, this.age});

  allPatient.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    gender = json['gender'];
    profile = json['profile'];
    iD = json['ID'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['profile'] = this.profile;
    data['ID'] = this.iD;
    data['age'] = this.age;
    return data;
  }
}
