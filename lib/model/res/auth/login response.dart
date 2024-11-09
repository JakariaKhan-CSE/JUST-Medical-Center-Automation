//https://javiercbk.github.io/json_to_dart/ (make json response to dart class model)
class LoginResponse {
  String? token;
  String? role;
  Others? others;

  LoginResponse({this.token, this.role, this.others});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    role = json['role'];
    others =
    json['others'] != null ? new Others.fromJson(json['others']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['role'] = this.role;
    if (this.others != null) {
      data['others'] = this.others!.toJson();
    }
    return data;
  }
}

class Others {
  String? sId;
  String? name;
  String? gender;
  String? role;
  String? email;
  String? password;
  String? profile;
  bool? isVerified;
  bool? isUpdateProfile;
  String? updatedAt;

  Others(
      {this.sId,
        this.name,
        this.gender,
        this.role,
        this.email,
        this.password,
        this.profile,
        this.isVerified,
        this.isUpdateProfile,
        this.updatedAt});

  Others.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    gender = json['gender'];
    role = json['role'];
    email = json['email'];
    password = json['password'];
    profile = json['profile'];
    isVerified = json['isVerified'];
    isUpdateProfile = json['isUpdateProfile'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['role'] = this.role;
    data['email'] = this.email;
    data['password'] = this.password;
    data['profile'] = this.profile;
    data['isVerified'] = this.isVerified;
    data['isUpdateProfile'] = this.isUpdateProfile;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
