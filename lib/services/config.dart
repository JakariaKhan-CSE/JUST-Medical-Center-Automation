class Config{
  //static const apiUrl = "http://10.0.0.101:5008";  // mess wifi
  //static const apiUrl = "http://192.168.9.169:5008";  // abdul khalek mess wifi
  //static const apiUrl = "http://192.168.0.114:5008";    // office wifi
  //static const apiUrl = "http://192.168.1.105:5008";   // home wifi
  //static const apiUrl = "https://just-medical-center-automation-system.onrender.com";
  static const apiUrl = "https://backend-just-medical-production.up.railway.app";
  static const String loginUrl = "/api/auth/login";
  static const String signUpUrl = "/api/auth/register";
  static const String emailVerifyUrl = "/api/auth/verify-otp";
  static const String profileurl = "/api/user/profile";
  static const String updateDoctorProfileurl = "/api/user/doctor-profile";
  static const String changePasswordurl = "/api/user/change-password";
  static const String totalDoctorurl = "/api/user/total-doctors";
  static const String prescriptionurl = "/api/user/prescriptions";
  static const String allpatienturl = "/api/doctors/allpatient";
  static const String createPrescriptionurl = "/api/doctors/prescription";
  static const String searchPatientUrl = "/api/doctors/search";
  // static const String jobs = "/api/jobs";
  // static const String search = "/api/jobs/search";
  // static const String profileUrl = "/api/users";
  // static const String bookmarkUrl = "/api/bookmarks";
  // static const String chatsUrl = "/api/chats";
  // static const String messagingUrl = "/api/messages";
}