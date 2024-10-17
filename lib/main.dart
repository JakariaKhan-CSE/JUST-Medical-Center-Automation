import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/adminController/adminController.dart';
import 'package:just_medical_center_automation/controller/common_controller.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:just_medical_center_automation/controller/patientController/indexChange.dart';
import 'package:just_medical_center_automation/controller/pharmacistController/pharmacistController.dart';
import 'package:just_medical_center_automation/screen/doctor/doctor_screen.dart';
import 'package:just_medical_center_automation/screen/patient/patient_screen.dart';
import 'package:just_medical_center_automation/screen/pharmacist/pharmacist_screen.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => IndexChange(),),
    ChangeNotifierProvider(create: (context) => AdminController(),),
    ChangeNotifierProvider(create: (context) => DoctorController(),),
    ChangeNotifierProvider(create: (context) => PharmacistController(),),
    ChangeNotifierProvider(create: (context) => CommonController(),),
  ],
  child: GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    home: PharmacistScreen()
  ),
  ),

  );
}

