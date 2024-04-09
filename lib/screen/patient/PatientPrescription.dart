import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/screen/common/prescriptiondesign.dart';

class PatientPrescription extends StatelessWidget {
  int prescription = 11;
  PatientPrescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Prescription Manager'),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Prescription: ${prescription}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),

            Expanded(
              child: GridView.builder(
                itemCount: prescription,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      print('index is : ${index}');
                      Get.to(PrescriptionDesign());
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/prescription blur.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),

                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 80,
                            color: Colors.grey.shade600,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dr. Jakaria Khan',style: TextStyle(color: Colors.white,fontSize: 15),),
                                Text('For: Myself',style: TextStyle(color: Colors.white,fontSize: 15),),
                                Text('8 april 2024 - 10:37 PM',style: TextStyle(color: Colors.white,fontSize: 12),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )




          ],
        ),
      ),
    );
  }
}
