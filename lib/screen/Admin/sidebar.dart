import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/adminController/adminController.dart';
import 'package:provider/provider.dart';

import '../../widget/admin/adminPicture.dart';
import '../../widget/admin/featureItemButton.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _pageController = Provider.of<AdminController>(context,listen: true);
    return Drawer(
      child: Container(
        color: Colors.white,
        //color: Colors.lightBlue.withOpacity(0.3),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const adminPicture(),
            const Divider(),
            const SizedBox(height: 30,),
            featureItem(featureName: "DashBoard",onTap: (){
      _pageController.SetIndex(0);
            },),
            const SizedBox(height: 15,),
            featureItem(featureName: "Add Doctor",onTap: (){
              _pageController.SetIndex(1);
            },),
            const SizedBox(height: 15,),
            featureItem(featureName: "Add Pharmacist",onTap: (){
              _pageController.SetIndex(2);
            },),
            const SizedBox(height: 15,),
            featureItem(featureName: "See all Medicine",onTap: (){
              _pageController.SetIndex(3);
            },),
            const SizedBox(height: 15,),
            featureItem(featureName: "Log Out",onTap: (){
              _pageController.SetIndex(4);
            },),

            const SizedBox(height: 30,),
            const Divider(),
          ],
        ),
      ),
    );
  }
}