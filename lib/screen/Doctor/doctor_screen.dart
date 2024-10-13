import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/widget/doctor/doctorMiddlePartFeatures.dart';
import 'package:just_medical_center_automation/widget/doctor/doctor_sidebar.dart';

import '../../responsive.dart';
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


