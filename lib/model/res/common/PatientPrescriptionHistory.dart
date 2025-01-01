class PatientHistory {
  List<Prescriptions>? prescriptions;

  PatientHistory({this.prescriptions});

  PatientHistory.fromJson(Map<String, dynamic> json) {
    if (json['prescriptions'] != null) {
      prescriptions = <Prescriptions>[];
      json['prescriptions'].forEach((v) {
        prescriptions!.add(new Prescriptions.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.prescriptions != null) {
      data['prescriptions'] =
          this.prescriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Prescriptions {
  String? sId;
  List<Medicines>? medicines;
  DoctorId? doctorId;
  String? patientId;
  String? iD;
  bool? status;
  String? timestamp;
  int? iV;

  Prescriptions(
      {this.sId,
        this.medicines,
        this.doctorId,
        this.patientId,
        this.iD,
        this.status,
        this.timestamp,
        this.iV});

  Prescriptions.fromJson(Map<String, dynamic> json) {
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
    patientId = json['patientId'];
    iD = json['ID'];
    status = json['status'];
    timestamp = json['timestamp'];
    iV = json['__v'];
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
    data['patientId'] = this.patientId;
    data['ID'] = this.iD;
    data['status'] = this.status;
    data['timestamp'] = this.timestamp;
    data['__v'] = this.iV;
    return data;
  }
}

class Medicines {
  bool? morning;
  bool? lunch;
  bool? dinner;
  bool? beforeMeal;
  String? name;
  int? quantity;
  String? sId;

  Medicines(
      {this.morning,
        this.lunch,
        this.dinner,
        this.beforeMeal,
        this.name,
        this.quantity,
        this.sId});

  Medicines.fromJson(Map<String, dynamic> json) {
    morning = json['morning'];
    lunch = json['lunch'];
    dinner = json['dinner'];
    beforeMeal = json['beforeMeal'];
    name = json['name'];
    quantity = json['quantity'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['morning'] = this.morning;
    data['lunch'] = this.lunch;
    data['dinner'] = this.dinner;
    data['beforeMeal'] = this.beforeMeal;
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
