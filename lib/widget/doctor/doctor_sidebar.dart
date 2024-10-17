import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:just_medical_center_automation/widget/doctor/component/doctorPicture.dart';
import 'package:provider/provider.dart';

import '../../screen/admin/widget/admin/featureItemButton.dart';
import 'component/doctorName.dart';

class DoctorSidebar extends StatelessWidget {
  const DoctorSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final _pageController = Provider.of<DoctorController>(context,listen: true);
    return Drawer(
      child: Container(
        color: Colors.white,
        //color: Colors.lightBlue.withOpacity(0.3),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [

            // show current doctor picture(which is log in)
             const doctorPicture(),
            const SizedBox(height: 20,),
            // show doctor name here
            const doctorName(doctorname: 'Md. Jakaria Ibna Azam Khan',),
            const SizedBox(height: 20,),
            const Divider(),
            const SizedBox(height: 30,),
            featureItem(featureName: "DashBoard",onTap: (){

              _pageController.SetIndex(0);
              Scaffold.of(context).closeDrawer();
            },),
            const SizedBox(height: 15,),
            featureItem(featureName: "See All Patient",onTap: (){

              _pageController.SetIndex(1);
              Scaffold.of(context).closeDrawer();
            },),
            const SizedBox(height: 15,),

            featureItem(featureName: "Update Profile",onTap: (){
              _pageController.SetIndex(2);
              Scaffold.of(context).closeDrawer();
            },),
            const SizedBox(height: 15,),
            featureItem(featureName: "Change Password",onTap: (){

              _pageController.SetIndex(3);
              Scaffold.of(context).closeDrawer();
            },),
            const SizedBox(height: 15,),
            featureItem(featureName: "Log Out",onTap: (){
              _pageController.SetIndex(4);
              Scaffold.of(context).closeDrawer();
            },),

            const SizedBox(height: 30,),
            const Divider(),
          ],
        ),
      ),
    );
  }
}


