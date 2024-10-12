import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/data/diagnosticTestData.dart';
import 'package:provider/provider.dart';

import '../../controller/doctorController/doctor_controller.dart';
import '../../data/patientData.dart';

class PatientTestReport extends StatelessWidget {
  const PatientTestReport({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<DoctorController>(context);
    return Scaffold(
      backgroundColor: Colors.orange.withOpacity(0.3),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 10),
        child: ListView.builder(
          itemCount: labDiagnosticDataList.length,
          itemBuilder: (context, index) {
            DiagonasticData diagonasticData = labDiagnosticDataList[index];
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Card(
                elevation: 6,
                shadowColor: Colors.yellow,
                child: ListTile(
                  contentPadding: EdgeInsets.all(12),
                  onTap: (){
                    //when click go to patient details page amd make prescription option
                    _controller.setDiagonasticData(diagonasticData); // use this bikolpo of constructor
                    _controller.SetIndex(10);

                  },

                  title: Text(diagonasticData.dateTime.toString(),style: TextStyle(fontWeight: FontWeight.w700),),
                  subtitle: Text(diagonasticData.labTechnicianName),
                  trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
                ),
              ),
            );
          },),
      ),
    );
  }
}
