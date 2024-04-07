import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/patientController/indexChange.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:just_medical_center_automation/auth/login.dart';
import 'package:just_medical_center_automation/auth/registration_page.dart';
import 'package:just_medical_center_automation/screen/homepage.dart';
import 'package:just_medical_center_automation/screen/patient/patient_screen.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => IndexChange(),)
  ],
  child: GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: PatientScreen(),
  ),
  ),

  );
}

