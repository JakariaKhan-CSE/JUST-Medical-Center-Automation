import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/screen/common/searchBarRoleWised.dart';

import '../../../../../responsive.dart';
class DashBoardDoctor extends StatelessWidget {
  const DashBoardDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            child: SearchBarRoleWise(hintText: "Search Patient by ID",onTap: (){
              //doctor search patient
            },),
          ),

        ],
      ),
    );
  }
}

