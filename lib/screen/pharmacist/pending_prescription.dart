import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:just_medical_center_automation/controller/pharmacistController/pharmacistController.dart';
import 'package:just_medical_center_automation/screen/pharmacist/widget/pharmacist/see_patient_prescription.dart';
import 'package:provider/provider.dart';

import '../../responsive.dart';
import '../common/prescriptiondesign.dart';

class PendingPrescriptionPage extends StatefulWidget {
  const PendingPrescriptionPage({super.key});

  @override
  State<PendingPrescriptionPage> createState() => _PendingPrescriptionPageState();
}

class _PendingPrescriptionPageState extends State<PendingPrescriptionPage> {
  final int prescription = 20;
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<PharmacistController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Pending Prescription: $prescription',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Divider(),
            const SizedBox(height: 30,),

            Expanded(
              child: GridView.builder(
                itemCount: prescription,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: !Responsive.isDesktop(context) ? 2 : 5,
                  crossAxisSpacing: Responsive.isMobile(context)? 10:25 ,
                  mainAxisSpacing: Responsive.isMobile(context)? 10:25,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      print('index is : $index');
                      _controller.SetIndex(5); // show patient prescription

                    },
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 200,
                          decoration: const BoxDecoration(
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
                            padding: const EdgeInsets.all(10),
                            child: const Column(
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
