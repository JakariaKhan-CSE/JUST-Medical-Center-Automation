import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/data/doctorData.dart';
import 'package:just_medical_center_automation/widget/common/customButton.dart';

import '../../../../../controller/adminController/adminDataController.dart';
import '../../../../../exports.dart';
import '../../../../../model/res/admin/pharmacist_response.dart';
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
    final adminDataController =
    Provider.of<AdminDataNotifier>(context, listen: true);
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Padding(
      padding: Responsive.isDesktop(context) ? EdgeInsets.symmetric(horizontal: 30,vertical: 20):
      EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child:  FutureBuilder<List<PharmacistRes>>(
          future: adminDataController.allPharmacist,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error ${snapshot.error}'),
              );
            } else {
              final allPharmacistData = snapshot.data;
              return ListView.builder(
                itemCount: allPharmacistData?.length,
                itemBuilder: (context, index) {
                  final data = allPharmacistData?[index];
                  return AspectRatio(
                    aspectRatio: Responsive.isDesktop(context) ? 3: 2.9,
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
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.network(data?.profile??'',fit: BoxFit.cover,height:Responsive.isDesktop(context) ? Height*0.3:55,width: Responsive.isDesktop(context) ? Width*0.15:55,),
                              ),
                              Responsive.isDesktop(context) ? SizedBox(width: 20,):SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(data?.name??'',style: Responsive.isDesktop(context) ?Theme.of(context).textTheme.titleLarge!.copyWith(
                                      color: Colors.black
                                  ):Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: Colors.black
                                  ),),
                                  SizedBox(height: 10,),
                                  Text(data?.email??'',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                      color: Colors.blueGrey.withOpacity(0.8)
                                  ),),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: FittedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (Responsive.isMobile(context))
                                    IconButton(onPressed: () {
                                      // doctor edit function here
                                    }, icon: Icon(Icons.edit_calendar,size: 22,color: Colors.orangeAccent,)),
                                  if (Responsive.isMobile(context))
                                    IconButton(onPressed: () {
                                      // doctor delete
                                    }, icon: Icon(Icons.delete, color: Colors.deepOrange,size: 22,)),
                                  if (Responsive.isDesktop(context))
                                    CustomButton(
                                        pressed: () {
                                          //write update database code
                                        },
                                        btnName: 'Update'),
                                  Responsive.isDesktop(context)
                                      ? SizedBox(
                                    height: 20,
                                  )
                                      : SizedBox(
                                    height: 5,
                                  ),
                                  if (Responsive.isDesktop(context))
                                    CustomButton(
                                        pressed: () {
                                          //write delete database code
                                        },
                                        btnName: 'Delete'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }),

    );
  }
}
