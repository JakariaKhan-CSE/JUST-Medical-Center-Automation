import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../controller/doctorController/doctor_controller.dart';
import '../../controller/doctorProvider.dart';

class SeeAllPatientList extends StatelessWidget {
  const SeeAllPatientList({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<DoctorController>(context);
    // first time fetch all patient list
    final doctorNotifier = Provider.of<DoctorNotifier>(context, listen: false);
    doctorNotifier.getAllPatientList();

    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.3),
      body: Consumer<DoctorNotifier>(builder: (context, doctorNotifier, child) {
        final patients = doctorNotifier.patientList;
        if (patients.isEmpty) {
          return Center(
            child: Text(
              'No Patients Found',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 10),
          child: ListView.builder(
            itemCount: patients.length,
            itemBuilder: (context, index) {
              final patient = patients[index];
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
                      _controller.SetIndex(6);

                    },
                    leading: CircleAvatar(
                        radius: 60,
                        child: patient.profile != null ? Image.network(patient.profile!) : Image.network('https://cdn-icons-png.flaticon.com/512/1533/1533506.png',fit: BoxFit.cover,)
                    ),
                    title: Text(patient.name!,style: TextStyle(fontWeight: FontWeight.w700),),
                    subtitle: Text(patient.iD.toString()),
                    trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
                  ),
                ),
              );
            },),
        );
      },),
    );
  }
}
