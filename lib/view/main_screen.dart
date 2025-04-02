import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/view/patient/patient_screen.dart';
import 'package:just_medical_center_automation/view/pharmacist/pharmacist_screen.dart';

import 'admin/admin_page.dart';
import 'doctor/doctor_screen.dart';

class MainScreen extends StatefulWidget {
  final String role;
  const MainScreen({super.key, required this.role});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<bool> _onWillPop() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Exit App"),
        content: const Text("Are you sure you want to exit?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text("Yes"),
          ),
        ],
      ),
    ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: _getScreenForRole(widget.role),
    );
  }

  Widget _getScreenForRole(String role) {
    switch (role) {
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
