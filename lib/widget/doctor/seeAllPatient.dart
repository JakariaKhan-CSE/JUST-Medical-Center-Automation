import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:just_medical_center_automation/data/patientData.dart';
import 'package:just_medical_center_automation/screen/doctor/patient_details_page.dart';
import 'package:provider/provider.dart';

class SeeAllPatientList extends StatelessWidget {
  const SeeAllPatientList({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<DoctorController>(context,listen: true);
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.3),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 10),
        child: ListView.builder(
          itemCount: patientList.length,
          itemBuilder: (context, index) {
            Patient patient = patientList[index];
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: Card(
              elevation: 6,
              shadowColor: Colors.yellow,
              child: ListTile(
                contentPadding: EdgeInsets.all(12),
                onTap: (){
                  //when click go to patient details page amd make prescription option
                  _controller.setPatientData(patient);
                  _controller.SetIndex(4);

                },
                leading: CircleAvatar(
                  radius: 60,
                  child: Image.network('https://cdn-icons-png.flaticon.com/512/1533/1533506.png',fit: BoxFit.cover,)
                ),
                title: Text(patient.name,style: TextStyle(fontWeight: FontWeight.w700),),
                subtitle: Text(patient.ID.toString()),
                trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
              ),
            ),
          );
        },),
      ),
    );
  }
}
