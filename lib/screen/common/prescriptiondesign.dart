import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_medical_center_automation/controller/prescriptionProvider.dart';
import 'package:just_medical_center_automation/model/res/patient/prescriptionResponse.dart';
import 'package:just_medical_center_automation/widget/common/prescription_right_side.dart';
import 'package:just_medical_center_automation/widget/common/patient_info_prescription.dart';
import 'package:just_medical_center_automation/widget/common/prescription_design_head.dart';
import 'package:just_medical_center_automation/widget/common/prescription_left_side.dart';
import 'package:provider/provider.dart';

class PrescriptionDesign extends StatelessWidget {
  // final DoctorModel doctorinfo; // get doctor which doctor write prescription for patient
  // final Patient patientInfo; // use this data for patient info field
  // final DateTime dateTimePrescription; // get from database
  // final MedicineData medicineData;

  const PrescriptionDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PrescriptionNotifier>(
        builder: (context, prescriptionNotifier, child) {
PrescriptionResponse? prescription = prescriptionNotifier.prescription;

DateTime dateTime = DateTime.parse(prescription!.timestamp!);

// Format for date as "10 Jan 2024"
String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
        return Padding(
          padding: EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Column(
            children: [
              PrescriptionDesignContainer(
                doctorName: prescription!.doctorId!.name ,
              date: formattedDate,),
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
                    Expanded(
                        flex: 3,
                        child: prescription_left_side()),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        flex: 6,
                        child: prescription_right_side())
                  ],
                ),
              ),
            ],
          ),
        );
      },) ,
    );
  }
}
