import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/widget/doctor/doctorMiddlePartFeatures.dart';
import 'package:just_medical_center_automation/widget/doctor/doctor_sidebar.dart';

import '../../widget/doctor/component/dashboardDoctor.dart';

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
              child: DoctorMiddlePartFeature()
          ),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 50)),
                    Text('Patient History',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.w600,letterSpacing: 2,wordSpacing: 5),),
                    Divider()
                  ],
                ),
              )),
        ],
      ),
    );
  }
}


