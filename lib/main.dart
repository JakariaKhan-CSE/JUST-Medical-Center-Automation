import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/adminController/adminController.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:just_medical_center_automation/controller/patientController/indexChange.dart';
import 'package:just_medical_center_automation/screen/Admin/admin_page.dart';
import 'package:just_medical_center_automation/screen/Doctor/doctor_screen.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:just_medical_center_automation/screen/patient/patient_screen.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => IndexChange(),),
    ChangeNotifierProvider(create: (context) => AdminController(),),
    ChangeNotifierProvider(create: (context) => DoctorController(),)
  ],
  child: GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    home: DoctorScreen()
  ),
  ),

  );
}

