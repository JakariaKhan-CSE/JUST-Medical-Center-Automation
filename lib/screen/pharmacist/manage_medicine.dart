import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/data/medicine%20data.dart';
import 'package:just_medical_center_automation/screen/common/searchBarRoleWised.dart';
import '../../responsive.dart';


class ManageMedicine extends StatelessWidget {
  const ManageMedicine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SearchBarRoleWise(hintText: "Search Medicine", onTap: (){
                // medicine search
              },),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text('All Medicine List',style:Responsive.isDesktop(context) ? Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold):
              Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),),

            ),

            SizedBox(height: 30,),
            Expanded(
              child: ListView.builder(
                itemCount: demoMedicineData.length+1,
                itemBuilder: (context, index) {
                  return Table(
                    textDirection: TextDirection.ltr,
                    border: TableBorder.all(color: Colors.black54, width: 1.0),
                    children: [
                      index==0?  TableRow(
                          children:[
                            Heading(text: 'SL No',) ,
                            Heading(text: 'Medicine Name'),
                            Heading(text: 'Quantity'),
                            Heading(text: 'Action'),
                          ]
                      ):
                      TableRow(
                          children: [
                            Data(text: (index).toString()),
                            Data(text: demoMedicineData[index-1].Medicine_Name) ,
                            Data(text: demoMedicineData[index-1].Quantity.toString()),
                            Center(
                              child: FittedBox(
                                child: Row(
                                  children: [

                                    Tooltip(
                                        message: "Edit Medicine",
                                        child: IconButton(onPressed: (){
                                          // print('index is: $index');
                                          // print('medicine name: ${demoMedicineData[index-1].Medicine_Name}');
                                        }, icon:Responsive.isDesktop(context) ? Icon(Icons.edit_calendar_outlined,size: 25, color: Colors.teal,):
                                        Icon(Icons.edit_calendar_outlined,size: 15, color: Colors.teal,))),
                                    Responsive.isDesktop(context) ? SizedBox(width: 10,) : SizedBox(width: 2,),
                                    Tooltip(
                                        message: "Delete Medicine",
                                        child: IconButton(onPressed: (){}, icon:Responsive.isDesktop(context) ? Icon(Icons.delete,size: 25, color: Colors.red,):
                                        Icon(Icons.delete,size: 15, color: Colors.red,))),

                                  ],
                                ),
                              ),
                            )
                          ]
                      )
                      ,


                    ],
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



class Heading extends StatelessWidget {
  final String text;
  const Heading({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.isDesktop(context) ? EdgeInsets.all(10.0):EdgeInsets.all(1),
      child: Text(text,textAlign: TextAlign.center,style: Responsive.isDesktop(context) ? TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Colors.black
      ):TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),overflow: TextOverflow.ellipsis,),
    );
  }
}

class Data extends StatelessWidget {
  final String text;
  const Data({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.isDesktop(context) ? EdgeInsets.all(10.0):EdgeInsets.all(1),
      child: Text(text,textAlign: TextAlign.center,style:Responsive.isDesktop(context) ? TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.black
      ):
      TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.black
      ),overflow: TextOverflow.ellipsis,),
    );
  }
}


