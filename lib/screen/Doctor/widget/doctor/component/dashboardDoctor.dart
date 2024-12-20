import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:just_medical_center_automation/controller/doctorProvider.dart';
import 'package:just_medical_center_automation/screen/common/searchBarRoleWised.dart';
import 'package:provider/provider.dart';

import '../../../../../responsive.dart';
class DashBoardDoctor extends StatefulWidget {
  const DashBoardDoctor({
    super.key,
  });

  @override
  State<DashBoardDoctor> createState() => _DashBoardDoctorState();
}

class _DashBoardDoctorState extends State<DashBoardDoctor> {
  final TextEditingController patientSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final DoctorNotifier doctorNotifier = Provider.of<DoctorNotifier>(context);
    return Container(
      color: Colors.grey.withOpacity(0.4),

      child: Stack(

        children: [
          Opacity(
            opacity: 0.3,
            child: Image.asset('images/doctor searching.jpg',fit: BoxFit.cover,width:MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.height),
          ),
          Positioned(
            top: 0,right: 0,
            child: SearchBarRoleWise(
              hintText: "Search Patient by ID",
              controller: patientSearch,
              onTap: (){
              if(patientSearch.text.isNotEmpty)
              doctorNotifier.searchPatient(int.parse(patientSearch.text));
              else
                Get.snackbar("Search Field Empty","Please search by patient ID",
                backgroundColor: Colors.pink);
            },),
          ),

        ],
      ),
    );
  }
}

