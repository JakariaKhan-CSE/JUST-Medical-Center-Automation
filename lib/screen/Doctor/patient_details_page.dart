import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
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
      body: Column(
        children: [
          Row(
            children: [
           Expanded(
             flex: 3,
             child: Column(
               children: [
                 doctorSeePatientLineInfo(name: "Patient Name",value: '${patient?.name}',),
                 SizedBox(height: 5,),
                 doctorSeePatientLineInfo(name: "Patient ID",value: '${patient?.ID}',),
                 SizedBox(height: 5,),
                 doctorSeePatientLineInfo(name: "Patient age",value: '${patient?.age}',),

               ],
             ),
           ),
              Expanded(child: Container())
              // patient picture here
            ],
          )
        ],
      ),
    );
  }
}


