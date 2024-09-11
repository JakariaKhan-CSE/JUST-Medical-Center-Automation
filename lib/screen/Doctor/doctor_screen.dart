import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/widget/doctor/doctor_sidebar.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 2,
              child: DoctorSidebar()
          ),
          Expanded(
              flex: 7,
              child: Container(
                color: Colors.grey,
              )),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
