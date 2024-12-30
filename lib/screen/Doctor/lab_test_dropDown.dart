import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/doctorController/dataController.dart';
import 'package:provider/provider.dart';

class LabTestDropdown extends StatefulWidget {
  const LabTestDropdown({super.key});

  @override
  State<LabTestDropdown> createState() => _LabTestDropdownState();
}

class _LabTestDropdownState extends State<LabTestDropdown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.tealAccent.withValues(alpha: 0.3),
      body: Consumer<DoctorDataController>(builder: (context, doctorDataNotifier, child) {
        if (doctorDataNotifier.dropdownItems.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: DropdownButton<String>(
            value: doctorDataNotifier.getSelectedItem(),
              hint: Text('Select a Test'),
              items: doctorDataNotifier.dropdownItems.map((item)=>
                  DropdownMenuItem(
                      value: item,
                      child: Text(item))).toList(),
              onChanged: (value) {
                if (value != null) {
                  doctorDataNotifier.setSelectedItem(value);
                }
              },),
        );
      },),
    );
  }
}
