/*
Benefits of Using a Barrel File
Simplifies Imports: You only need to import one file instead of multiple files.

Better Organization: Keeps your codebase clean and organized.

Easier Maintenance: If you need to add or remove files, you only need to update the barrel file.

Notes
Avoid creating circular dependencies when using barrel files.

Barrel files are commonly used in large projects to manage imports efficiently.
 */

// for main.dart
export  'package:firebase_core/firebase_core.dart';
export 'package:flutter/material.dart';
export 'package:just_medical_center_automation/controller/adminController/adminController.dart';
export 'package:just_medical_center_automation/controller/common_controller.dart';
export 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
export 'package:just_medical_center_automation/controller/doctorController/doctor_image_provider.dart';
export 'package:just_medical_center_automation/controller/doctorProvider.dart';
export 'package:just_medical_center_automation/controller/labTechController/labTechnicianController.dart';
export 'package:just_medical_center_automation/controller/patientController/indexChange.dart';
export 'package:just_medical_center_automation/controller/patientController/profileProvider.dart';
export 'package:just_medical_center_automation/controller/pharmacistController/pharmacistController.dart';
export 'package:just_medical_center_automation/controller/prescriptionProvider.dart';
export 'package:just_medical_center_automation/controller/signUpProvider.dart';
export 'package:just_medical_center_automation/services/connectivity_service.dart';
export 'package:just_medical_center_automation/splash_screen.dart';
export 'package:just_medical_center_automation/view/auth/login_page.dart';
export 'package:provider/provider.dart';
export 'package:get/get.dart';
export 'controller/doctorController/dataController.dart';
export 'controller/patientController/imageProvider.dart';
export 'controller/loginProvider.dart';
export 'firebase_options.dart';


