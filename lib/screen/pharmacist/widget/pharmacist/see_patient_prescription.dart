import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/widget/common/customButton.dart';

import '../../../../widget/common/patient_info_prescription.dart';
import '../../../../widget/common/prescription_design_head.dart';
import '../../../../widget/common/prescription_left_side.dart';
import '../../../../widget/common/prescription_right_side.dart';

class SeePatientPrescription extends StatefulWidget {
  const SeePatientPrescription({super.key});

  @override
  State<SeePatientPrescription> createState() => _SeePatientPrescriptionState();
}

class _SeePatientPrescriptionState extends State<SeePatientPrescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Column(
          children: [
            // change later
            const PrescriptionDesignContainer(doctorName: 'Jakaria',date: '10 Jan 2024',),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const patient_info_prescription(),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),

            // medicine name and others
            const Expanded(
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
            CustomButton(pressed: (){
              // decrease pending prescription quantity
              // add total patient in pharmacist dashboard

            }, btnName: "Complete", backgroundColor: Colors.orange,),
            SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
}
