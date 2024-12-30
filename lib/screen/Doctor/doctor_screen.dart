import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/doctorController/dataController.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:just_medical_center_automation/screen/doctor/widget/doctor/component/patient_history.dart';
import 'package:just_medical_center_automation/screen/doctor/widget/doctor/doctorMiddlePartFeatures.dart';
import 'package:just_medical_center_automation/screen/doctor/widget/doctor/doctor_sidebar.dart';
import 'package:provider/provider.dart';
import '../../controller/patientController/profileProvider.dart';
import '../../responsive.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  /*
  Independent Instance of DoctorDataController:
The DoctorDataController instance is created directly in the State of DoctorScreen and is not managed by Provider. This results in the instance not being accessible throughout the widget tree and limits its reusability.

Fix: Use Provider to manage the state of DoctorDataController and its data.
   */
// DoctorDataController doctorDataController = DoctorDataController(); use less this line
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*
    fetchDropdownItems Not Called at the Right Time:

The method fetchDropdownItems is called directly in initState. While this works, it doesn't integrate with the Provider lifecycle, which may result in data not being properly reflected in the UI.
    Fix: Initialize the data through Provider's ChangeNotifier.
     */
    // doctorDataController.fetchDropdownItems();
    // Initialize ProfileNotifier to fetch doctor profile
    final profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    profileNotifier.getDoctorProfile().then((profileData) {
      if (profileData != null) {
        profileNotifier.setUserData(profileData);
      }
    });

    // Fetch dropdown data using DoctorDataController
    final doctorDataController = Provider.of<DoctorDataController>(context, listen: false);
    doctorDataController.fetchDropdownItems();
  }
  @override
  Widget build(BuildContext context) {
/*
The getDoctorProfile method is being called in the build method, which is not a good practice as it can lead to repeated calls and unexpected behavior.
Fix: Move the asynchronous call to initState or another controlled method.
 */
    // see carefully if return type not Future not work .then()
//     final profileNotifier = Provider.of<ProfileNotifier>(context,listen: false);
// profileNotifier.getDoctorProfile().then((profileData){
//
//   if(profileData != null){
//
//     profileNotifier.setUserData(profileData);
//   }
//
// });

    return Scaffold(
      appBar: Responsive.isDesktop(context) ? null: AppBar(
          leading: Builder(builder: (context) => IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: const Icon(Icons.menu)),)
      ),
      drawer: DoctorSidebar(),
      body: Row(
        children: [
          if(Responsive.isDesktop(context)) // desktop holei aita show korbe otherwise side a show korbe na
          Expanded(
              flex: 2,
              child: DoctorSidebar()
          ),
          Expanded(
              flex: 7,
              child: DoctorMiddlePartFeature()
          ),
          if(Responsive.isDesktop(context))  // desktop holei aita show korbe otherwise show korbe na
          Expanded(
              flex: 2,
              child: PatientHistory()),
        ],
      ),
    );
  }
}




