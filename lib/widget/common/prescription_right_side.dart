import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/data/medicine_info.dart';
class prescription_right_side extends StatelessWidget {
  const prescription_right_side({
    super.key,
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
          ListView.builder(shrinkWrap: true,itemCount: MedicineData.data.length,itemBuilder: (context, index) {
            Map<String,dynamic> oneData = MedicineData.data[index];

              return Column(
                children: [
                  Row(
                    children: [
                      // index
                      Text(
                        '${index+1}.',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      // medicine name
                      Text(
                        oneData['medicine_name'],
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        oneData['rule'],
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        oneData['day'],
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  // SizedBox(height: 10,),
                  Divider(),
                  SizedBox(height: 10,),
                ],
              );
      
      
          },),
      
      
          SizedBox(height: 20,),
          Row(
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
          )
      
        ],
      ),
    );
  }
}
