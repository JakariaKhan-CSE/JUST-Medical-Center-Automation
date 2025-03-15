class PharmacistRes {
  String? gender;
  String? sId;
  String? name;
  String? role;
  String? email;
  String? password;
  String? profile;
  bool? isVerified;
  bool? isUpdateProfile;
  String? createdAt;
  String? updatedAt;
  int? iV;

  PharmacistRes(
      {this.gender,
        this.sId,
        this.name,
        this.role,
        this.email,
        this.password,
        this.profile,
        this.isVerified,
        this.isUpdateProfile,
        this.createdAt,
        this.updatedAt,
        this.iV});

  PharmacistRes.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    sId = json['_id'];
    name = json['name'];
    role = json['role'];
    email = json['email'];
    password = json['password'];
    profile = json['profile'];
    isVerified = json['isVerified'];
    isUpdateProfile = json['isUpdateProfile'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['role'] = this.role;
    data['email'] = this.email;
    data['password'] = this.password;
    data['profile'] = this.profile;
    data['isVerified'] = this.isVerified;
    data['isUpdateProfile'] = this.isUpdateProfile;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
