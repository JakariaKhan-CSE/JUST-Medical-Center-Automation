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
    return Container(
      color: Colors.white,
      //color: Colors.lightBlue.withOpacity(0.3),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          adminPicture(),
          Divider(),
          SizedBox(height: 30,),
          featureItem(featureName: "DashBoard",onTap: (){
_pageController.SetIndex(0);
          },),
          SizedBox(height: 15,),
          featureItem(featureName: "Add Doctor",onTap: (){
            _pageController.SetIndex(1);
          },),
          SizedBox(height: 15,),
          featureItem(featureName: "Add Pharmacist",onTap: (){
            _pageController.SetIndex(2);
          },),
          SizedBox(height: 15,),
          featureItem(featureName: "See all Medicine",onTap: (){
            _pageController.SetIndex(3);
          },),
          SizedBox(height: 15,),
          featureItem(featureName: "Log Out",onTap: (){
            _pageController.SetIndex(4);
          },),

          SizedBox(height: 30,),
          Divider(),
        ],
      ),
    );
  }
}