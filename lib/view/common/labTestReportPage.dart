import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:provider/provider.dart';

import '../../data/diagnosticTestData.dart';

class LabTestReportPage extends StatelessWidget {

  const LabTestReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<DoctorController>(context);
    DiagonasticData? _labTestInfo = _controller.diagonasticData; // get diagnostic data like constructor
    return Scaffold(
      body: Center(
        child: Image.network(_labTestInfo!.reportImageUrl,fit: BoxFit.contain,),
      ),
    );
  }
}
