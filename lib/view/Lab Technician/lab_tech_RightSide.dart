import 'package:flutter/cupertino.dart';
import 'package:just_medical_center_automation/controller/labTechController/labTechnicianController.dart';
import 'package:provider/provider.dart';

import 'change_password.dart';
import 'dashboard_labTech.dart';



class LabTechnicianRightPartFeature extends StatelessWidget {
  const LabTechnicianRightPartFeature({super.key});

  @override
  Widget build(BuildContext context) {
    final _pageController = Provider.of<LabTechnicianController>(context, listen: true);
    if(_pageController.current_index == 0)
      return DashBoardLabTechnician();
    else if(_pageController.current_index == 1)
      return ChangePasswordLabTechnician();
    else
      return DashBoardLabTechnician();
  }
}
