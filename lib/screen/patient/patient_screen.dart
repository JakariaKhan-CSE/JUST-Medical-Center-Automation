// this is patient home page and target design is mobile
import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/patientController/indexChange.dart';
import 'package:just_medical_center_automation/screen/patient/PatientPrescription.dart';
import 'package:just_medical_center_automation/screen/patient/patient_home.dart';
import 'package:just_medical_center_automation/screen/patient/patient_profile.dart';
import 'package:provider/provider.dart';
class PatientScreen extends StatelessWidget {

  List Screen = [PatientHome(),PatientPrescription(),PatientProfile()];
  PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _indexChange = Provider.of<IndexChange>(context,listen: true);
    return Scaffold(
      body: Screen[_indexChange.currentPageIndex], // change page using Screen List(which contain home and profile page)
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          // using state management. currentPageIndex = index
          _indexChange.ChangeIndexValue(index);

        },
        indicatorColor: Colors.amber,
        selectedIndex: _indexChange.currentPageIndex,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.document_scanner_sharp), label: 'Prescription History'),
          NavigationDestination(icon: Icon(Icons.person_pin), label: 'Profile'),
        ],
      ),

    );
  }
}
