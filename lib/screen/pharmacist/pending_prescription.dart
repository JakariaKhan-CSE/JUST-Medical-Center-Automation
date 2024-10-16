import 'package:flutter/material.dart';

class PendingPrescriptionPage extends StatefulWidget {
  const PendingPrescriptionPage({super.key});

  @override
  State<PendingPrescriptionPage> createState() => _PendingPrescriptionPageState();
}

class _PendingPrescriptionPageState extends State<PendingPrescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Pending Prescription"),),
    );
  }
}
