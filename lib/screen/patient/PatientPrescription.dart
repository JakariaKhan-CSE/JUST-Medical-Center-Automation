import 'package:flutter/material.dart';

class PatientPrescription extends StatelessWidget {
  const PatientPrescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Prescription History',style: TextStyle(fontSize: 40),),),
    );
  }
}
