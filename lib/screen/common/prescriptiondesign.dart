import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/data/medicine%20data.dart';
import 'package:just_medical_center_automation/data/patientData.dart';
import 'package:just_medical_center_automation/widget/common/prescription_right_side.dart';
import 'package:just_medical_center_automation/widget/common/patient_info_prescription.dart';
import 'package:just_medical_center_automation/widget/common/prescription_design_head.dart';
import 'package:just_medical_center_automation/widget/common/prescription_left_side.dart';

class PrescriptionDesign extends StatelessWidget {
  // final DoctorModel doctorinfo; // get doctor which doctor write prescription for patient
  // final Patient patientInfo; // use this data for patient info field
  // final DateTime dateTimePrescription; // get from database
  // final MedicineData medicineData;

  const PrescriptionDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(  // InteractiveViewer widget use for screen zoom in/out
        child: const Padding(
          padding: EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Column(
            children: [
             PrescriptionDesignContainer(),
              SizedBox(
                height: 10,
              ),
              Divider(),
              patient_info_prescription(),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
        
              // medicine name and others
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   prescription_left_side(),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(flex: 2, child: prescription_right_side())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
