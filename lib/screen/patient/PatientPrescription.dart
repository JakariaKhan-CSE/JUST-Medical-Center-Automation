import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_medical_center_automation/controller/prescriptionProvider.dart';
import 'package:just_medical_center_automation/screen/common/prescriptiondesign.dart';
import 'package:provider/provider.dart';

import '../../controller/patientController/indexChange.dart';

class PatientPrescription extends StatelessWidget {

  PatientPrescription({super.key});

  @override
  Widget build(BuildContext context) {
    final indexChange = Provider.of<IndexChangeProvider>(context,listen: true);
    return Scaffold(
    //  appBar: AppBar(title: const Text('Prescription Manager'),centerTitle: true,),
      body: Consumer<PrescriptionNotifier>(
        builder: (context, prescriptionNotifier, child) {
          // Firstly getAll prescription
          prescriptionNotifier.getAllPrescription();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: FutureBuilder(
            future: prescriptionNotifier.prescriptionList,
            builder: (context, snapshot) {
              if (snapshot.connectionState ==
                  ConnectionState.waiting) {
                return Container();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error is: ${snapshot.error}'),
                );
              }
              else{
                final prescriptions = snapshot.data; // all prescription
              return  Column(
                children: [
                  Text('Total Prescription: ${prescriptions?.length}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 30,),
                  prescriptions?.length ==0 ? Center(child: Text('No Prescription',style: Theme.of(context).textTheme.titleMedium,))
                 : Expanded(
                      child: GridView.builder(
                        itemCount: prescriptions?.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          final prescription = prescriptions?[index];
                          var timestamp = prescription?.timestamp;
                          DateTime dateTime = DateTime.parse(timestamp!);

                          // Format for date as "10 Jan 2024"
                          String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);

                          // Format for time as "10:37 AM"
                          String formattedTime = DateFormat('hh:mm a').format(dateTime);
                          return GestureDetector(
                            onTap: (){
                              // print('index is : $index');
                              // not navigate use pages in body so that, bottom nav bar not hide
                              // Get.to(const PrescriptionDesign());
                              prescriptionNotifier.setPrescriptionData(prescription!);
                              indexChange.ChangeIndexValue(4); // prescription design
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
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${prescription?.doctorId?.name}',style: TextStyle(color: Colors.white,fontSize: 15),),
                                        Text('For: Myself',style: TextStyle(color: Colors.white,fontSize: 15),),
                                        Text('${formattedDate} - ${formattedTime}',style: TextStyle(color: Colors.white,fontSize: 12),)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                ],
              );
              }
            },

          ),
        );
      },),
    );
  }
}
