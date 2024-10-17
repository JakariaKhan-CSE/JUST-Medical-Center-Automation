import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/data/doctorData.dart';
import 'package:just_medical_center_automation/widget/common/customButton.dart';

import '../../../../../responsive.dart';


class ShowAllPharmacistUpdateDelete extends StatefulWidget {
  const ShowAllPharmacistUpdateDelete({super.key});

  @override
  State<ShowAllPharmacistUpdateDelete> createState() =>
      _ShowAllPharmacistUpdateDeleteState();
}

class _ShowAllPharmacistUpdateDeleteState
    extends State<ShowAllPharmacistUpdateDelete> {
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Padding(
      padding: Responsive.isDesktop(context) ? EdgeInsets.symmetric(horizontal: 30,vertical: 20):
      EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: ListView.builder(
        itemCount: DoctorData.dataPharmacist.length,
        itemBuilder: (context, index) {
          final data = DoctorData.dataPharmacist[index];
          return AspectRatio(
            aspectRatio: Responsive.isDesktop(context) ? 3: 2.5,
            child: Container(
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
                      Image.asset(data['img'],fit: BoxFit.cover,height:Responsive.isDesktop(context) ? Height*0.3:55,width: Responsive.isDesktop(context) ? Width*0.15:55,),
                      Responsive.isDesktop(context) ? SizedBox(width: 20,):SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(data['name'],style: Responsive.isDesktop(context) ?Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.black
                          ):Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Colors.black
                          ),),
                          SizedBox(height: 10,),
                          Text(data['department']??'',style: Theme.of(context).textTheme.titleSmall!.copyWith(
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
                        Responsive.isDesktop(context) ? SizedBox(height: 20,):SizedBox(height: 5,),
                        CustomButton(pressed: (){
                          //write delete database code
                        }, btnName: 'Delete'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
