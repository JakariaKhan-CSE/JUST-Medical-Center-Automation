import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:just_medical_center_automation/widget/common/customButton.dart';
import 'package:provider/provider.dart';

import '../../data/patientData.dart';
import '../../widget/doctor/component/doctorSeePatientLineInfo.dart';

class PatientDetailsPage extends StatefulWidget {

  const PatientDetailsPage({super.key});

  @override
  State<PatientDetailsPage> createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<DoctorController>(context,listen: false);
    Patient? patient = _controller.patient;
    return Scaffold(
      backgroundColor: Colors.cyanAccent.withOpacity(0.6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
             Expanded(
               flex: 2,
               child: Column(
                 children: [
                   doctorSeePatientLineInfo(name: "Patient Name",value: '${patient?.name}',),
                   SizedBox(height: 10,),
                   doctorSeePatientLineInfo(name: "Patient ID",value: '${patient?.ID}',),
                   SizedBox(height: 10,),
                   doctorSeePatientLineInfo(name: "Patient age",value: '${patient?.age}',),
                   SizedBox(height: 10,),
                   doctorSeePatientLineInfo(name: "Patient Department",value: '${patient?.department}',),

                 ],
               ),
             ),
                Spacer(),
                Container(
                    height: 150,
                    width: 150,
                    child: Image.network('https://media.istockphoto.com/id/1130884625/vector/user-member-vector-icon-for-ui-user-interface-or-profile-face-avatar-app-in-circle-design.jpg?s=612x612&w=0&k=20&c=1ky-gNHiS2iyLsUPQkxAtPBWH1BZt0PKBB1WBtxQJRE=',fit: BoxFit.cover,))
                // patient picture here
              ],
            ),
            SizedBox(height: 100,),
            CustomButton(pressed: (){
              // show make prescription screen
              _controller.SetIndex(5);
            }, btnName: 'Make Prescription',backgroundColor: Colors.lightGreenAccent,),
            SizedBox(height: 30,),
            CustomButton(pressed: (){}, btnName: 'Previous Prescription',backgroundColor: Colors.deepOrangeAccent,)
          ],
        ),
      ),
    );
  }
}


