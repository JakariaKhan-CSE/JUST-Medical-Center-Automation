import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/data/medicine_info.dart';
import 'package:just_medical_center_automation/model/res/patient/prescriptionResponse.dart';
class prescription_right_side extends StatelessWidget {
  final List<Medicines> medicines;
  const prescription_right_side({
    super.key, required this.medicines,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'images/rx.jpg',
            height: 20,
            width: 20,
            fit: BoxFit.cover,
          ),
          // SizedBox(
          //   height: 10,
          // ),
          ListView.builder(shrinkWrap: true,
            itemCount: medicines.length,
            physics: ScrollPhysics(), // use so that scroll medicine
            itemBuilder: (context, index) {
            Medicines medicine = medicines[index];

              return Column(
                children: [
                  Row(
                    children: [
                      // index
                      Text(
                        '${index+1}.',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      // medicine name
                      Text(
                        medicine.name??'',
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 10,),
                      Text(
                        '1+0+1',
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        (medicine.quantity).toString(),
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  // SizedBox(height: 10,),
                  const Divider(),
                  const SizedBox(height: 10,),
                ],
              );


          },),
      
      
          const SizedBox(height: 20,),
          const Row(
            children: [
              Text(
                'Follow-up within: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                '2 weeks',
                style: TextStyle( fontSize: 15),
              ),
            ],
          ),
          SizedBox(height: 10,)
      
        ],
      ),
    );
  }
}
