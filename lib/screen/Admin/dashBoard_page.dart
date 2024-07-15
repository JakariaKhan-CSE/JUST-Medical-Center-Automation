import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/data/doctorData.dart';

import '../../widget/admin/component/allDoctorList.dart';
import '../../widget/admin/component/doctorListText.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.withOpacity(0.1),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          margin: EdgeInsets.only(left: 20,right: 20,top: 50,bottom: 20),
          child: Column(
            children: [
listText(listName: 'List all Doctors',),
              SizedBox(height: 20,),
              allHorizontalList(data: DoctorData.data,),
              SizedBox(height: 40,),
              listText(listName: 'List all Pharmacist'),
              SizedBox(height: 20,),
              allHorizontalList(data: DoctorData.dataPharmacist)
            ],
          ),
        ),
      ),
    );
  }
}




