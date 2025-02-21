import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/view/pharmacist/widget/pharmacist/pharmacist_right_side.dart';
import 'package:just_medical_center_automation/view/pharmacist/widget/pharmacist/pharmacist_sidebar.dart';
import '../../responsive.dart';
class PharmacistScreen extends StatefulWidget {
  const PharmacistScreen({super.key});

  @override
  State<PharmacistScreen> createState() => _PharmacistScreenState();
}

class _PharmacistScreenState extends State<PharmacistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context) ? null: AppBar(
          leading: Builder(builder: (context) => IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: const Icon(Icons.menu)),)
      ),
      drawer: PharmacistSidebar(),
      body: Row(
        children: [
          if(Responsive.isDesktop(context)) // desktop holei aita show korbe otherwise side a show korbe na
            Expanded(
                flex: 2,
                child: PharmacistSidebar()
            ),
          Expanded(
              flex: 7,
              child: PharmacistRightPartFeature()
          ),

        ],
      ),
    );
  }
}




