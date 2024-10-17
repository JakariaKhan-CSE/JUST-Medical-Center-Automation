import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/screen/patient/widget/patient/home/available_doctor_text.dart';
import 'package:just_medical_center_automation/screen/patient/widget/patient/home/availabledoctorlist.dart';
import 'package:just_medical_center_automation/screen/patient/widget/patient/home/doctor_listbuilder.dart';
import 'package:just_medical_center_automation/screen/patient/widget/patient/home/doctors_all_text.dart';
import 'package:just_medical_center_automation/screen/patient/widget/patient/home/patient_home_search.dart';


class PatientHome extends StatelessWidget {
  const PatientHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child:
                CircleAvatar(backgroundImage: AssetImage('images/jakaria.jpg')),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: const [
            SizedBox(
              height: 20,
            ),
            PatientHomeSearch(),
            SizedBox(
              height: 20,
            ),
            doctors_all_text(),
            SizedBox(
              height: 10,
            ),
            doctorListbuilder(),
            SizedBox(
              height: 10,
            ),
            available_doctor_text(),
            SizedBox(
              height: 10,
            ),
            availabledoctorlist()
          ],
        ),
      ),
    );
  }
}
