import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/doctorController/data_load.dart';
import 'package:just_medical_center_automation/screen/doctor/widget/doctor/component/patient_history.dart';
import 'package:just_medical_center_automation/screen/doctor/widget/doctor/doctorMiddlePartFeatures.dart';
import 'package:just_medical_center_automation/screen/doctor/widget/doctor/doctor_sidebar.dart';
import '../../responsive.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  DataLoadForDoctor dataLoadForDoctor = DataLoadForDoctor();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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




