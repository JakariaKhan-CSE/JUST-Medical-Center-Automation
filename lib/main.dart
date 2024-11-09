import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/adminController/adminController.dart';
import 'package:just_medical_center_automation/controller/common_controller.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:just_medical_center_automation/controller/labTechController/labTechnicianController.dart';
import 'package:just_medical_center_automation/controller/patientController/indexChange.dart';
import 'package:just_medical_center_automation/controller/pharmacistController/pharmacistController.dart';
import 'package:just_medical_center_automation/controller/signUpProvider.dart';
import 'package:just_medical_center_automation/screen/auth/login_page.dart';

import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'controller/patientController/imageProvider.dart';
import 'controller/loginProvider.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => IndexChange(),),
    ChangeNotifierProvider(create: (context) => AdminController(),),
    ChangeNotifierProvider(create: (context) => DoctorController(),),
    ChangeNotifierProvider(create: (context) => PharmacistController(),),
    ChangeNotifierProvider(create: (context) => CommonController(),),
    ChangeNotifierProvider(create: (context) => LabTechnicianController(),),
    ChangeNotifierProvider(create: (context) => ImageUploader(),),
    ChangeNotifierProvider(create: (context) => LoginNotifier(),),
    ChangeNotifierProvider(create: (context) => SignUpNotifier(),),
  ],
  child: GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    // home: PatientScreen()
    //home: PersonalDetails(),
    home: LoginPage(),
  ),
  ),

  );
}

