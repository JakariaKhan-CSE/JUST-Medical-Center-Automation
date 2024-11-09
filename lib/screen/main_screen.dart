import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/screen/admin/admin_page.dart';
import 'package:just_medical_center_automation/screen/doctor/doctor_screen.dart';
import 'package:just_medical_center_automation/screen/patient/patient_screen.dart';
import 'package:just_medical_center_automation/screen/pharmacist/pharmacist_screen.dart';

class MainScreen extends StatefulWidget {
  final String role;
  const MainScreen({super.key, required this.role});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    switch(widget.role){
      case 'patient':
        return PatientScreen();
      case 'admin':
        return AdminPage();
      case 'doctor':
        return DoctorScreen();
      case 'pharmacist':
        return PharmacistScreen();
      default:
        return PatientScreen();

    }
  }
}
