import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_medical_center_automation/controller/adminController/adminController.dart';
import 'package:just_medical_center_automation/data/doctorData.dart';
import 'package:provider/provider.dart';

import '../../widget/admin/component/allDoctorList.dart';
import '../../widget/admin/component/doctorListText.dart';
import '../../widget/admin/component/showAllDoctorwithUpdateDelte.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AdminController>(context,listen: true);
    return Scaffold(
      backgroundColor: Colors.deepPurple.withOpacity(0.1),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          margin: EdgeInsets.only(left: 20,right: 20,top: 50,bottom: 20),
          child: Column(
            children: [
listText(listName: 'List all Doctors',onTap: (){
 controller.SetIndex(4) ;
},),
              SizedBox(height: 20,),
              allHorizontalList(data: DoctorData.data,),
              SizedBox(height: 40,),
              listText(listName: 'List all Pharmacist',onTap: (){
controller.SetIndex(5);
              },),
              SizedBox(height: 20,),
              allHorizontalList(data: DoctorData.dataPharmacist)
            ],
          ),
        ),
      ),
    );
  }
}




