import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:just_medical_center_automation/data/prescriptionData.dart';
import 'package:just_medical_center_automation/model/res/common/PatientPrescriptionHistory.dart';
import 'package:provider/provider.dart';


class PreviousPrescription extends StatelessWidget {
  const PreviousPrescription({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<DoctorController>(context);
    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(0.3),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 10),
        child: Consumer<DoctorController>(builder: (context, doctorController, child) {
          doctorController.getPatientHistory();
          return FutureBuilder(future: _controller.patientHistory, builder: (context, snapshot) {
           print(snapshot.error);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error is: ${snapshot.error}'),
              );
            } else {
              var prescriptionList = snapshot.data;
              // very important useful this
              // Sort the list by timestamp in descending order
              prescriptionList?.sort((a, b) {
                // Parse the timestamps and compare them
                return DateTime.parse(b.timestamp!).compareTo(DateTime.parse(a.timestamp!));
              });
              return ListView.builder(
                itemCount: prescriptionList?.length,
                itemBuilder: (context, index) {
                  Prescriptions? prescriptions = prescriptionList?[index];
                  print(prescriptions?.timestamp);
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
                          _controller.SetIndex(9);

                        },

                        title: Text(DateFormat('d MMMM y').format(DateTime.parse(prescriptions?.timestamp??DateTime.now().toIso8601String())),
                          style: TextStyle(fontWeight: FontWeight.w700),),
                        subtitle: Text(prescriptions?.doctorId!.name??''),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
                      ),
                    ),
                  );
                },);
            }
          },);
        },)

      ),
    );
  }
}
