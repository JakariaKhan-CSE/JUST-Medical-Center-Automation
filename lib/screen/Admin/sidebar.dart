import 'package:flutter/material.dart';

import '../../widget/admin/adminPicture.dart';
import '../../widget/admin/featureItemButton.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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

          },),
          SizedBox(height: 15,),
          featureItem(featureName: "Add Doctor",onTap: (){

          },),
          SizedBox(height: 15,),
          featureItem(featureName: "Add Pharmacist",onTap: (){

          },),
          SizedBox(height: 15,),
          featureItem(featureName: "See all Medicine",onTap: (){

          },),
          SizedBox(height: 15,),
          featureItem(featureName: "Log Out",onTap: (){

          },),

          SizedBox(height: 30,),
          Divider(),
        ],
      ),
    );
  }
}