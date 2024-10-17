import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_medical_center_automation/screen/patient/widget/patient/profile/patient_profile_row.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:Colors.grey,
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('images/jakaria.jpg'),
              ),
            ),
            Center(
                child: TextButton(
                    onPressed: () {}, child: const Text('Change Profile Picture'))),
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
            PatientProfileRow(leading: 'Student ID', title: '190152',icon: Icons.copy,),
            PatientProfileRow(leading: 'Age', title: '23',),
            PatientProfileRow(leading: 'E-mail', title: 'mdjakariaibnaazamkhan@gmail.com',),
            PatientProfileRow(leading: 'Phone Number', title: '01612882257',),
            PatientProfileRow(leading: 'Gender', title: 'Male',),
            PatientProfileRow(leading: 'Date of Birth', title: '04-09-2002',),

            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Center(child: TextButton(onPressed: () {}, child: const Text('Edit your Profile'))),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
