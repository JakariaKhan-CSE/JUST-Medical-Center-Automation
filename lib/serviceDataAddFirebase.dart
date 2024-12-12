import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'data/servicesData.dart';

class Servicedataaddfirebase extends StatefulWidget {
  const Servicedataaddfirebase({super.key});

  @override
  State<Servicedataaddfirebase> createState() => _ServicedataaddfirebaseState();
}
// i create this class so that easily add services data in firestore
// after add data this class is not required
class _ServicedataaddfirebaseState extends State<Servicedataaddfirebase> {

  // Future<void> serviceDataAddFirebase()
  // async {
  //   final CollectionReference serviceData = FirebaseFirestore.instance.collection('services');
  //
  //   for(var i=0; i<allServicesData.length; i++)
  //     {
  //       var record = {
  //         "testName": allServicesData[i].testName,
  //         "rate": allServicesData[i].rate
  //       };
  //       // each record add firestore database
  //       serviceData.add(record);
  //     }
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          print('btn click');
          // serviceDataAddFirebase();
          print('program terminate');
        }, child: Text('Data add to firebase')),
      ),
    );
  }
}
