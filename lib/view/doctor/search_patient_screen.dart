import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:just_medical_center_automation/controller/doctorProvider.dart';
import 'package:provider/provider.dart';

class SearchPatientScreen extends StatelessWidget {
  const SearchPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _doctorNotifier = Provider.of<DoctorNotifier>(context);
    final _controller = Provider.of<DoctorController>(context);
    // Display patient data from the provider
    final patient = _doctorNotifier.patient;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: patient != null ? Card(
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
                child: patient.profile != null ? Image.network(patient.profile??'' ) : Image.network('https://cdn-icons-png.flaticon.com/512/1533/1533506.png',fit: BoxFit.cover,)
            ),
            title: Text(patient.name!,style: TextStyle(fontWeight: FontWeight.w700),),
            subtitle: Text(patient.iD.toString()),
            trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
          ),
        ):Center(child: Text('No Patient Found',style: Theme.of(context).textTheme.displaySmall,),),
      ),
    );
  }
}
