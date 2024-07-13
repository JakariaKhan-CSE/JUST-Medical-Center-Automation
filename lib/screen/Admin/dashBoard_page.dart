import 'package:flutter/material.dart';

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
listDoctorText(),
              SizedBox(height: 20,),
              allDoctorList()
            ],
          ),
        ),
      ),
    );
  }
}




