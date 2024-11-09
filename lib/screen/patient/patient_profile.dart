import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/screen/patient/widget/patient/profile/patient_profile_row.dart';
import 'package:provider/provider.dart';

import '../../controller/patientController/indexChange.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final indexChange = Provider.of<IndexChange>(context,listen: true);
    return Scaffold(
      // backgroundColor:Colors.grey,
      // appBar: AppBar(
      //   title: const Text('Profile'),
      //   centerTitle: true,
      //   // leading: IconButton(
      //   //   onPressed: () {
      //   //     Get.back();
      //   //   },
      //   //   icon: const Icon(
      //   //     Icons.arrow_back_ios,
      //   //     size: 20,
      //   //   ),
      //   // ),
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Align(
            //     alignment: Alignment.center,
            //     child: Text('Profile',style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),)),
            const Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('images/jakaria.jpg'),
              ),
            ),
            // Center(
            //     child: TextButton(
            //         onPressed: () {}, child: const Text('Change Profile Picture'))
            // ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Profile Information',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 23),
            ),
            const SizedBox(
              height: 15,
            ),
            PatientProfileRow(leading: 'Name',title: 'Md. Jakaria Ibna Azam Khan',),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Personal Information',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 23),
            ),
            const SizedBox(
              height: 10,
            ),
            PatientProfileRow(leading: 'Student ID', title: '190152'),
            PatientProfileRow(leading: 'Age', title: '23',),
            PatientProfileRow(leading: 'E-mail', title: 'mdjakariaibnaazamkhan@gmail.com',),
            PatientProfileRow(leading: 'Phone Number', title: '01612882257',),
            PatientProfileRow(leading: 'Gender', title: 'Male',),
           // PatientProfileRow(leading: 'Date of Birth', title: '04-09-2002',),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Center(child: ElevatedButton(onPressed: () {
              // update profile page show on body
              indexChange.ChangeIndexValue(6);
            },
                child: const Text('Edit your Profile',style: TextStyle(fontSize: 18),))),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
