import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/widget/common/prescription_right_side.dart';
import 'package:just_medical_center_automation/widget/common/patient_info_prescription.dart';
import 'package:just_medical_center_automation/widget/common/prescription_design_head.dart';
import 'package:just_medical_center_automation/widget/common/prescription_left_side.dart';

class PrescriptionDesign extends StatelessWidget {
  const PrescriptionDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(  // InteractiveViewer widget use for screen zoom in/out
        child: Padding(
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
