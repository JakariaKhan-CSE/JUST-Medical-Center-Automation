import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/pharmacistController/pharmacistController.dart';
import 'package:provider/provider.dart';

import '../../../admin/widget/admin/featureItemButton.dart';
import 'components/pharmacist_name.dart';


class PharmacistSidebar extends StatelessWidget {
  const PharmacistSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final _pageController = Provider.of<PharmacistController>(context,listen: true);
    return Drawer(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.lightGreenAccent.withOpacity(0.2),
          //color: Colors.lightBlue.withOpacity(0.3),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [

              // show current doctor picture(which is log in)
              PharmacistInfo(pharmacistName: "Welcome Pharmacist"),
              featureItem(featureName: "DashBoard",onTap: (){

                _pageController.SetIndex(0);
                Scaffold.of(context).closeDrawer();
              },),
              const SizedBox(height: 15,),
              featureItem(featureName: "Pending Prescription",onTap: (){
                _pageController.SetIndex(1);
                Scaffold.of(context).closeDrawer();
              },),
              const SizedBox(height: 15,),

              featureItem(featureName: "Add New Medicine",onTap: (){
                _pageController.SetIndex(2);
                Scaffold.of(context).closeDrawer();
              },),
              const SizedBox(height: 15,),
              featureItem(featureName: "Manage Medicine",onTap: (){
                _pageController.SetIndex(3);
                Scaffold.of(context).closeDrawer();
              },),
              const SizedBox(height: 15,),
              featureItem(featureName: "Change Password",onTap: (){

                _pageController.SetIndex(4);
                Scaffold.of(context).closeDrawer();
              },),

              const SizedBox(height: 15,),
              featureItem(featureName: "Log Out",onTap: (){
                _pageController.SetIndex(5);
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


