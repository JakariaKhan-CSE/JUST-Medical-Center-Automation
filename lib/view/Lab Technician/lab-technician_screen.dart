import 'package:flutter/material.dart';
import '../../responsive.dart';
import 'lab_tech_RightSide.dart';
import 'lab_technician_sidebar.dart';
class LabTechnicianScreen extends StatefulWidget {
  const LabTechnicianScreen({super.key});

  @override
  State<LabTechnicianScreen> createState() => _LabTechnicianScreenState();
}

class _LabTechnicianScreenState extends State<LabTechnicianScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context) ? null: AppBar(
          leading: Builder(builder: (context) => IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: const Icon(Icons.menu)),)
      ),
      drawer: LabTechnicianSidebar(),
      body: Row(
        children: [
          if(Responsive.isDesktop(context)) // desktop holei aita show korbe otherwise side a show korbe na
            Expanded(
                flex: 2,
                child: LabTechnicianSidebar()
            ),
          Expanded(
              flex: 7,
              child: LabTechnicianRightPartFeature()
          ),

        ],
      ),
    );
  }
}




