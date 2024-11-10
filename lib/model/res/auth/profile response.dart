// before make Profile Response model
// Use POST Man then call get profile(also use token) http.get request
// copy response then Json to Dart Convert
class ProfileResponse {
  String? message;
  User? user;

  ProfileResponse({this.message, this.user});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

  User(
      {this.sId,
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
        this.phone});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    return data;
  }
}

