class ProfileResponse {
  String? message;
  User? user;

  ProfileResponse({this.message, this.user});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? gender;
  String? role;
  String? email;
  String? profile;
  bool? isVerified;
  bool? isUpdateProfile;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? iD;
  int? age;
  String? phone;
  String? publicID;
  String? description;
  String? signature;
  String? specialist;
  String? publicId2;

  User({
    this.sId,
    this.name,
    this.gender,
    this.role,
    this.email,
    this.profile,
    this.isVerified,
    this.isUpdateProfile,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.iD,
    this.age,
    this.phone,
    this.publicID,
    this.description,
    this.signature,
    this.specialist,
    this.publicId2,
  });

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    gender = json['gender'];
    role = json['role'];
    email = json['email'];
    profile = json['profile'];
    isVerified = json['isVerified'];
    isUpdateProfile = json['isUpdateProfile'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    iD = json['ID'];
    age = json['age'];
    phone = json['phone'];
    publicID = json['publicId'];
    description = json['description'];
    signature = json['signature'];
    specialist = json['specialist'];
    publicId2 = json['publicId2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['role'] = this.role;
    data['email'] = this.email;
    data['profile'] = this.profile;
    data['isVerified'] = this.isVerified;
    data['isUpdateProfile'] = this.isUpdateProfile;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['ID'] = this.iD;
    data['age'] = this.age;
    data['phone'] = this.phone;
    data['publicId'] = this.publicID;
    data['description'] = this.description;
    data['signature'] = this.signature;
    data['specialist'] = this.specialist;
    data['publicId2'] = this.publicId2;
    return data;
  }
}
