import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/doctorProvider.dart';
import 'package:just_medical_center_automation/model/res/patient/doctorResponse.dart';
import 'package:provider/provider.dart';

import '../../../../../data/doctorData.dart';


class doctorListbuilder extends StatelessWidget {
  const doctorListbuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorNotifier>(
      builder: (context, doctorNotifier, child) {
        // Firstly getAll doctors
        doctorNotifier.getDoctors();
      return Expanded(
        // if nested class avoid this model. remove useless attribute and make single model. So that easily access each attribute
        child: FutureBuilder<List<TotalDoctors>>(
          future: doctorNotifier.doctorList,
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
              final doctors = snapshot.data; // all doctor
              return GridView.builder(
                shrinkWrap: true,

                itemCount: doctors?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,crossAxisSpacing: 2,mainAxisSpacing: 2),
                itemBuilder: (context, index) {
                  final doctor = doctors?[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                doctor?.profile??'',
                                fit: BoxFit.contain,
                                width: 150,
                                height: 150,
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  doctor!.name!,overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  doctor.specialist??'MBBS Doctor',overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            )),
                      ],
                    ),
                  );
                },);
            }
          },

        ),
      );
    },);
  }
}
