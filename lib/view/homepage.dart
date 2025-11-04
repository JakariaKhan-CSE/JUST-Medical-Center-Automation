import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/view/patient/PatientPrescription.dart';
import 'package:just_medical_center_automation/view/patient/patient_home.dart';
import 'package:just_medical_center_automation/view/patient/patient_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Future<void> _loadDatabase()async{
  //   try{
  //     await Firebase.initializeApp(
  //
  //         options: const FirebaseOptions(
  //
  //             apiKey: 'AIzaSyBdgtN-5WaNCWTh-TZKKp1Qy-srBRCm1PQ',
  //             appId: '1:57891280768:android:dea5183bb6e86d2ea09365',
  //             messagingSenderId: '57891280768',
  //             projectId: 'just-medical-center'
  //         )
  //     );
  //   }catch(e)
  //   {
  //     print('error is: $e');
  //   }
  //
  //
  // }

  @override
  void initState() {
    // _loadDatabase();
    super.initState();
  }
 // List Screen = [const PatientHome(),PatientPrescription(),const PatientProfile()];
  List Screen = [const PatientHome(),PatientPrescription(),const PatientProfile()];
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child:  Image.asset('images/home picture.jpg'),
            ),
            const Text('24/7 On Campus Medical Services',textAlign:TextAlign.center ,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.6
            ),),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('The campus has a large and well equipped medical center with four specialist doctors. There is also a 24/7 ambulance service for emergency patient'
                  ' transportations. Students can get medical service at 24/7 basis which is free of cost. '
                  'Students also get the necessary medicines which are prescribed by the doctors for their '
                  'treatments without any cost.',textAlign: TextAlign.justify, style: TextStyle(
                letterSpacing: 0.8,
                wordSpacing: 1.2,


              ),),
            )
          ],
        ),
      ),
    ),

    );
  }
}