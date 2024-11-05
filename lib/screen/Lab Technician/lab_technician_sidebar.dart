import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:just_medical_center_automation/controller/labTechController/labTechnicianController.dart';
import 'package:provider/provider.dart';

import '../admin/widget/admin/featureItemButton.dart';
import '../pharmacist/widget/pharmacist/components/pharmacist_name.dart';



class LabTechnicianSidebar extends StatelessWidget {
  const LabTechnicianSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final _pageController = Provider.of<LabTechnicianController>(context,listen: true);
    return Drawer(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: Get.size.height,
          color: Colors.lightGreenAccent.withOpacity(0.2),
          //color: Colors.lightBlue.withOpacity(0.3),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [

              // show current doctor picture(which is log in)
              PharmacistInfo(pharmacistName: "Welcome Lab Technician",imageLink: "https://img.freepik.com/premium-vector/cute-lab-technician-preparing-samples-cartoon-vector-icon_1022901-113149.jpg",),
              featureItem(featureName: "DashBoard",onTap: (){

                _pageController.SetIndex(0);
                Scaffold.of(context).closeDrawer();
              },),

              const SizedBox(height: 15,),

              featureItem(featureName: "Change Password",onTap: (){

                _pageController.SetIndex(1);
                Scaffold.of(context).closeDrawer();
              },),

              const SizedBox(height: 15,),
              featureItem(featureName: "Log Out",onTap: (){
                _pageController.SetIndex(2);
                Scaffold.of(context).closeDrawer();
              },),

              const SizedBox(height: 30,),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}


