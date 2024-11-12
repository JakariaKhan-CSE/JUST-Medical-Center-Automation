import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/patientController/profileProvider.dart';
import 'package:just_medical_center_automation/screen/patient/widget/patient/profile/patient_profile_row.dart';
import 'package:just_medical_center_automation/services/config.dart';
import 'package:provider/provider.dart';

import '../../controller/patientController/indexChange.dart';


class PatientProfile extends StatelessWidget {
  const PatientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final indexChange = Provider.of<IndexChangeProvider>(context,listen: true);
    return Scaffold(
      body: Consumer<ProfileNotifier>(builder: (context, profileNotifier, child) {
        profileNotifier.getProfile();

        return FutureBuilder(
          future: profileNotifier.profile,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting)
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(snapshot.hasError)
            {
              return Center(
                child: Text('Error ${snapshot.error}'),
              );
            }
            else{
              final userData = snapshot.data;
              // i use bottom nav bar. so, i can navigate another page(not used constructor)
              // so, i add and fetch data from profileNotifier
              profileNotifier.setUserData(userData!);

              String imageUrl = '${Config.apiUrl}/${userData.user?.profile}';
              // print(imageUrl);
             return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Center(
                      // child: CircleAvatar(
                      //   radius: 70,
                      //   backgroundImage:userData?.user?.gender == 'male' ? NetworkImage('https://thumbs.dreamstime.com/b/corporate-man-icon-circle-shape-flat-style-vector-eps-332592832.jpg'):
                      //   NetworkImage('https://as1.ftcdn.net/v2/jpg/02/03/26/54/1000_F_203265415_7jG4Vrjrt8Ky5dMDPcIhbmTYOOz5B6M8.jpg'),
                      // ),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage:userData?.user?.profile != null ? NetworkImage(imageUrl):
                          NetworkImage('https://thumbs.dreamstime.com/b/corporate-man-icon-circle-shape-flat-style-vector-eps-332592832.jpg')
                         ,
                        )
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
                    PatientProfileRow(leading: 'Name',title: userData!.user!.name!,),  //userData!.user!.name! (be careful !) last one. If error show use this
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
                    PatientProfileRow(leading: 'Student ID', title: (userData.user!.iD!).toString()),
                    PatientProfileRow(leading: 'Age', title: (userData.user!.age!).toString(),),
                    PatientProfileRow(leading: 'E-mail', title: userData.user!.email!,),
                    PatientProfileRow(leading: 'Phone Number', title: userData.user!.phone!,),
                    PatientProfileRow(leading: 'Gender', title: userData.user!.gender!,),
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
              );
            }
          },

        );
      },),
    );
  }
}
