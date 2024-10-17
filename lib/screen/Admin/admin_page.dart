import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/screen/Admin/sidebar.dart';
import 'package:just_medical_center_automation/screen/admin/widget/admin/adminRightSideFeaturePage.dart';
import '../../responsive.dart';


class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context) ? null: AppBar(
          leading: Builder(builder: (context) => IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: const Icon(Icons.menu)),)
      ),
      drawer: SideBar(),
      body: Row(
        children: [
          if(Responsive.isDesktop(context))
          Expanded(
              flex: 2,
              child: SideBar()
          ),
          Expanded(
              flex: 7,
              child: Container(color: Colors.green.withOpacity(0.3),
                child: Adminrightsidefeaturepage(),
              )
          )
        ],
      ),
    );
  }
}






