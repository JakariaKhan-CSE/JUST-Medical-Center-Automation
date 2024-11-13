import 'dart:convert';

List<PrescriptionResponse> totalPrescriptionFromJson(String str) =>
    List<PrescriptionResponse>.from(json.decode(str)["prescriptions"].map((x) => PrescriptionResponse.fromJson(x)));

class PrescriptionResponse {
  String? sId;
  List<Medicines>? medicines;
  DoctorId? doctorId;
  PatientId? patientId;
  String? iD;
  bool? status;
  String? timestamp;

  PrescriptionResponse(
      {this.sId,
        this.medicines,
        this.doctorId,
        this.patientId,
        this.iD,
        this.status,
        this.timestamp});

  PrescriptionResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['medicines'] != null) {
      medicines = <Medicines>[];
      json['medicines'].forEach((v) {
        medicines!.add(new Medicines.fromJson(v));
      });
    }
    doctorId = json['doctorId'] != null
        ? new DoctorId.fromJson(json['doctorId'])
        : null;
    patientId = json['patientId'] != null
        ? new PatientId.fromJson(json['patientId'])
        : null;
    iD = json['ID'];
    status = json['status'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.medicines != null) {
      data['medicines'] = this.medicines!.map((v) => v.toJson()).toList();
    }
    if (this.doctorId != null) {
      data['doctorId'] = this.doctorId!.toJson();
    }
    if (this.patientId != null) {
      data['patientId'] = this.patientId!.toJson();
    }
    data['ID'] = this.iD;
    data['status'] = this.status;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Medicines {
  String? name;
  int? quantity;
  String? sId;

  Medicines({this.name, this.quantity, this.sId});

  Medicines.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['_id'] = this.sId;
    return data;
  }
}

class DoctorId {
  String? sId;
  String? name;

  DoctorId({this.sId, this.name});

  DoctorId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

class PatientId {
  String? sId;
  String? name;
  String? gender;
  String? iD;
  int? age;

  PatientId({this.sId, this.name, this.gender, this.iD, this.age});

  PatientId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    gender = json['gender'];
    iD = json['ID'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['ID'] = this.iD;
    data['age'] = this.age;
    return data;
  }
}
