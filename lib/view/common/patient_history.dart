import 'package:flutter/material.dart';
import '../../model/res/common/PatientPrescriptionHistory.dart';

class PatientHistoryWidget extends StatelessWidget {
  final PatientHistory patientHistory;

  const PatientHistoryWidget({Key? key, required this.patientHistory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Patient Prescription History", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            patientHistory.prescriptions != null && patientHistory.prescriptions!.isNotEmpty
                ? Column(
              children: patientHistory.prescriptions!.map((prescription) {
                return ListTile(
                  title: Text("Doctor: ${prescription.doctorId?.name ?? 'Unknown'}"),
                  subtitle: Text("Date: ${prescription.timestamp ?? 'N/A'}"),
                );
              }).toList(),
            )
                : Text("No prescriptions available"),
          ],
        ),
      ),
    );
  }
}
