import 'package:flutter/cupertino.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:just_medical_center_automation/widget/common/seeAllPatient.dart';
import 'package:provider/provider.dart';

import '../../../common/labTestReportPage.dart';
import '../../../common/password_change_allUser.dart';
import '../../../common/prescriptiondesign.dart';
import '../../lab_test_dropDown.dart';
import '../../make_prescription.dart';
import '../../patient_details_page.dart';
import '../../patient_test_report.dart';
import '../../previous_prescription.dart';
import '../../search_patient_screen.dart';
import '../../updateprofile_page.dart';
import 'component/dashboardDoctor.dart';



class DoctorMiddlePartFeature extends StatelessWidget {
  const DoctorMiddlePartFeature({super.key});

  @override
  Widget build(BuildContext context) {
    final _pageController = Provider.of<DoctorController>(context, listen: true);
    if(_pageController.current_index == 0)
      return DashBoardDoctor();
    else if(_pageController.current_index == 1)
      return SeeAllPatientList();
    else if(_pageController.current_index == 2)
      return UpdateProfilePage();
    else if(_pageController.current_index == 3)
      return PasswordChangeAllUser();
    else if(_pageController.current_index == 4)
      return DashBoardDoctor(); // this is for logout functionalities
    else if(_pageController.current_index == 5)
      return MakePrescription();
    else if(_pageController.current_index == 6)
      return PatientDetailsPage();
    else if(_pageController.current_index == 7)
      return PreviousPrescription();
    else if(_pageController.current_index == 8)
      return PatientTestReport();
    else if(_pageController.current_index == 9)
      //return PatientPrescription();
      return PrescriptionDesign();
    else if(_pageController.current_index == 10)
      return LabTestReportPage();
    else if(_pageController.current_index == 11)
      return SearchPatientScreen();
    else if(_pageController.current_index == 12)
      return LabTestDropdown();
    else
      return DashBoardDoctor();
  }
}
