import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/widget/doctor/doctorMiddlePartFeatures.dart';
import 'package:just_medical_center_automation/widget/doctor/doctor_sidebar.dart';

import '../../responsive.dart';
import '../../widget/doctor/component/dashboardDoctor.dart';
import '../../widget/doctor/component/patient_history.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context) ? null: AppBar(
          leading: Builder(builder: (context) => IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: const Icon(Icons.menu)),)
      ),
      drawer: DoctorSidebar(),
      body: Row(
        children: [
          if(Responsive.isDesktop(context)) // desktop holei aita show korbe otherwise side a show korbe na
          Expanded(
              flex: 2,
              child: DoctorSidebar()
          ),
          Expanded(
              flex: 7,
              child: DoctorMiddlePartFeature()
          ),
          if(Responsive.isDesktop(context))  // desktop holei aita show korbe otherwise show korbe na
          Expanded(
              flex: 2,
              child: PatientHistory()),
        ],
      ),
    );
  }
}




