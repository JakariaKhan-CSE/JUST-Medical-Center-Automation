import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/adminController/adminController.dart';
import 'package:just_medical_center_automation/controller/common_controller.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:just_medical_center_automation/controller/doctorProvider.dart';
import 'package:just_medical_center_automation/controller/labTechController/labTechnicianController.dart';
import 'package:just_medical_center_automation/controller/patientController/indexChange.dart';
import 'package:just_medical_center_automation/controller/patientController/profileProvider.dart';
import 'package:just_medical_center_automation/controller/pharmacistController/pharmacistController.dart';
import 'package:just_medical_center_automation/controller/prescriptionProvider.dart';
import 'package:just_medical_center_automation/controller/signUpProvider.dart';
import 'package:just_medical_center_automation/screen/auth/login_page.dart';
import 'package:just_medical_center_automation/screen/main_screen.dart';
import 'package:just_medical_center_automation/serviceDataAddFirebase.dart';
import 'package:just_medical_center_automation/services/connectivity_service.dart';
import 'package:just_medical_center_automation/splash_screen.dart';

import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/patientController/imageProvider.dart';
import 'controller/loginProvider.dart';
import 'firebase_options.dart';
/*
In your main.dart file, initialize the ConnectivityService before
running the app. This will ensure that connectivity checking
is active throughout the app lifecycle.
 */
Widget defaultHome = const LoginPage();

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  // prottek page a internet connection check kora lagbe na
  // ai main function theke alltime monitoring korbe
  ConnectivityService.instance.initialize();
  /*
  Centralized: The connectivity check and alert are handled in one place, reducing the need to add code on every page.
Performance: With this setup, there’s no need to create multiple connectivity listeners across different pages.
User Experience: Users will see the connectivity status regardless of where they are in the app.
   */
  try{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }catch(e)
  {
    print('error is: $e');
  }
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // // final entrypoint = prefs.getBool('entrypoint')??false;  // this is useful when use onBoarding Screen
  // final loggedIn = prefs.getBool('loggedIn')??false;
  // final role = prefs.getString('role')??'patient';
  // if(loggedIn)
  // {
  //   defaultHome =  MainScreen(role: role,); // local storage e loggedIn true thakle bar bar app open korar somoi login screen show korbe na. MainScreen a cole jabe
  // }
  // else{
  //   defaultHome = const LoginPage();
  // }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => IndexChangeProvider(),),
    ChangeNotifierProvider(create: (context) => AdminController(),),
    ChangeNotifierProvider(create: (context) => DoctorController(),),
    ChangeNotifierProvider(create: (context) => PharmacistController(),),
    ChangeNotifierProvider(create: (context) => CommonController(),),
    ChangeNotifierProvider(create: (context) => LabTechnicianController(),),
    ChangeNotifierProvider(create: (context) => ImageUploader(),),
    ChangeNotifierProvider(create: (context) => LoginNotifier(),),
    ChangeNotifierProvider(create: (context) => SignUpNotifier(),),
    ChangeNotifierProvider(create: (context) => ProfileNotifier(),),
    ChangeNotifierProvider(create: (context) => DoctorNotifier(),),
    ChangeNotifierProvider(create: (context) => PrescriptionNotifier(),),
  ],
  child: GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),

    home: SplashScreen(),

  ),
  ),

  );
}

