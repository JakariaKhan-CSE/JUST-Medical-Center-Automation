import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/data/prescriptionData.dart';


class PreviousPrescription extends StatelessWidget {
  const PreviousPrescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(0.3),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 10),
        child: ListView.builder(
          itemCount: prescriptionDataList.length,
          itemBuilder: (context, index) {
            PrescriptionData prescriptionData = prescriptionDataList[index];
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Card(
                elevation: 6,
                shadowColor: Colors.yellow,
                child: ListTile(
                  contentPadding: EdgeInsets.all(12),
                  onTap: (){
                    //when click go to patient details page amd make prescription option
                    // _controller.setPatientData(patient);
                    // _controller.SetIndex(6);

                  },

                  title: Text(prescriptionData.dateTime.toString(),style: TextStyle(fontWeight: FontWeight.w700),),
                  subtitle: Text(prescriptionData.doctorName),
                  trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
                ),
              ),
            );
          },),
      ),
    );
  }
}
