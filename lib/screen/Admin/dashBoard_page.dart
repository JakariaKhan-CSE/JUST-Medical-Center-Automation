import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/adminController/adminController.dart';
import 'package:just_medical_center_automation/data/doctorData.dart';
import 'package:just_medical_center_automation/screen/admin/widget/admin/component/allDoctorList.dart';
import 'package:just_medical_center_automation/screen/admin/widget/admin/component/doctorListText.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AdminController>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.deepPurple.withOpacity(0.1),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          margin: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.home,
                    size: 36,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Dashboard',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        letterSpacing: 1.4),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 55),
                child: Text(
                  'Home',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: 1.3),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.blue,
                thickness: 1.5,
              ),
              SizedBox(
                height: 20,
              ),
              listText(
                listName: 'List all Doctors',
                onTap: () {
                  controller.SetIndex(4);
                },
              ),
              SizedBox(
                height: 20,
              ),
              allHorizontalList(
                data: DoctorData.data,
              ),
              SizedBox(
                height: 40,
              ),
              listText(
                listName: 'List all Pharmacist',
                onTap: () {
                  controller.SetIndex(5);
                },
              ),
              SizedBox(
                height: 20,
              ),
              allHorizontalList(data: DoctorData.dataPharmacist)
            ],
          ),
        ),
      ),
    );
  }
}
