import 'package:flutter/material.dart';

class ManageMedicine extends StatefulWidget {
  const ManageMedicine({super.key});

  @override
  State<ManageMedicine> createState() => _ManageMedicineState();
}

class _ManageMedicineState extends State<ManageMedicine> {
  @override
  Widget build(BuildContext context) {
    // added medicine search feature here
    return Scaffold(
      body: Center(child: Text("Manage Medicine page"),),
    );
  }
}
