import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:provider/provider.dart';

import '../../../../controller/loginProvider.dart';
import '../../../../controller/patientController/profileProvider.dart';
import '../../../../model/res/auth/profile response.dart';
import '../../../admin/widget/admin/featureItemButton.dart';
import '../../../auth/login_page.dart';
import 'component/doctorName.dart';
import 'component/doctorPicture.dart';

class DoctorSidebar extends StatelessWidget {
  const DoctorSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final loginNotifier = Provider.of<LoginNotifier>(context);
    final _pageController = Provider.of<DoctorController>(context,listen: true);
    final profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    ProfileResponse? doctorProfile = profileNotifier.getUserData();
    return Drawer(
      child: Container(
        color: Colors.white,
        //color: Colors.lightBlue.withOpacity(0.3),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 15,),
            // show current doctor picture(which is log in)
             doctorPicture(image: doctorProfile?.user?.profile??'',),
            const SizedBox(height: 20,),
            // show doctor name here
            doctorName(doctorname: doctorProfile?.user?.name??'',),
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
              Get.offAll(LoginPage());
              loginNotifier.logout();
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


