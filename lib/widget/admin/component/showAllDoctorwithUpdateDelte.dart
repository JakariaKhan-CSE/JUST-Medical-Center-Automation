import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/data/doctorData.dart';
import 'package:just_medical_center_automation/widget/common/customButton.dart';

class Showalldoctorwithupdatedelte extends StatefulWidget {
  const Showalldoctorwithupdatedelte({super.key});

  @override
  State<Showalldoctorwithupdatedelte> createState() =>
      _ShowalldoctorwithupdatedelteState();
}

class _ShowalldoctorwithupdatedelteState
    extends State<Showalldoctorwithupdatedelte> {
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
      child: ListView.builder(
        itemCount: DoctorData.data.length,
        itemBuilder: (context, index) {
          final data = DoctorData.data[index];
          return Container(
            height: Height*0.3,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
                // color: Colors.grey.withOpacity(0.4)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
Image.asset(data['img'],fit: BoxFit.cover,height: Height*0.3,width: Width*0.15,),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(data['name'],style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black
                        ),),
                        SizedBox(height: 10,),
                        Text(data['department'],style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.blueGrey.withOpacity(0.8)
                        ),),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomButton(pressed: (){
                        //write update database code
                      }, btnName: 'Update'),
                      SizedBox(height: 20,),
                      CustomButton(pressed: (){
                        //write delete database code
                      }, btnName: 'Delete'),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
