// before make Profile Response model
// Use POST Man then call get profile(also use token) http.get request
// copy response then Json to Dart Convert
class ProfileResponse {
  String? _message;
  User? _user;

  ProfileResponse({String? message, User? user}) {
    if (message != null) {
      _message = message;
    }
    if (user != null) {
      _user = user;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  User? get user => _user;
  set user(User? user) => _user = user;

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = _message;
    if (_user != null) {
      data['user'] = _user!.toJson();
    }
    return data;
  }
}

class User {
  String? _sId;
  String? _name;
  String? _gender;
  String? _role;
  String? _email;
  String? _profile;
  bool? _isVerified;
  bool? _isUpdateProfile;
  String? _createdAt;
  String? _updatedAt;
  int? _iV;
  String? _iD;
  int? _age;
  String? _phone;

  User(
      {String? sId,
        String? name,
        String? gender,
        String? role,
        String? email,
        String? profile,
        bool? isVerified,
        bool? isUpdateProfile,
        String? createdAt,
        String? updatedAt,
        int? iV,
        String? iD,
        int? age,
        String? phone}) {
    if (sId != null) {
      _sId = sId;
    }
    if (name != null) {
      _name = name;
    }
    if (gender != null) {
      _gender = gender;
    }
    if (role != null) {
      _role = role;
    }
    if (email != null) {
      _email = email;
    }
    if (profile != null) {
      _profile = profile;
    }
    if (isVerified != null) {
      _isVerified = isVerified;
    }
    if (isUpdateProfile != null) {
      _isUpdateProfile = isUpdateProfile;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (iV != null) {
      _iV = iV;
    }
    if (iD != null) {
      _iD = iD;
    }
    if (age != null) {
      _age = age;
    }
    if (phone != null) {
      _phone = phone;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get role => _role;
  set role(String? role) => _role = role;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get profile => _profile;
  set profile(String? profile) => _profile = profile;
  bool? get isVerified => _isVerified;
  set isVerified(bool? isVerified) => _isVerified = isVerified;
  bool? get isUpdateProfile => _isUpdateProfile;
  set isUpdateProfile(bool? isUpdateProfile) =>
      _isUpdateProfile = isUpdateProfile;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;
  String? get iD => _iD;
  set iD(String? iD) => _iD = iD;
  int? get age => _age;
  set age(int? age) => _age = age;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;

  User.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _name = json['name'];
    _gender = json['gender'];
    _role = json['role'];
    _email = json['email'];
    _profile = json['profile'];
    _isVerified = json['isVerified'];
    _isUpdateProfile = json['isUpdateProfile'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _iV = json['__v'];
    _iD = json['ID'];
    _age = json['age'];
    _phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = _sId;
    data['name'] = _name;
    data['gender'] = _gender;
    data['role'] = _role;
    data['email'] = _email;
    data['profile'] = _profile;
    data['isVerified'] = _isVerified;
    data['isUpdateProfile'] = _isUpdateProfile;
    data['createdAt'] = _createdAt;
    data['updatedAt'] = _updatedAt;
    data['__v'] = _iV;
    data['ID'] = _iD;
    data['age'] = _age;
    data['phone'] = _phone;
    return data;
  }
}
