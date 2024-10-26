import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/data/medicine%20data.dart';
import 'package:just_medical_center_automation/screen/pharmacist/widget/searchBar.dart';


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
            searchBar(),
            SizedBox(height: 20,),
            Center(
              child: Text('All Medicine List',style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),),

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
                            Heading(text: 'SL No',),
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
                              child: Row(
                                children: [
                                  Spacer(),
                                  Tooltip(
                                      message: "Edit Medicine",
                                      child: IconButton(onPressed: (){
                                        // print('index is: $index');
                                        // print('medicine name: ${demoMedicineData[index-1].Medicine_Name}');
                                      }, icon: Icon(Icons.edit_calendar_outlined,size: 25, color: Colors.teal,))),
                                  SizedBox(width: 10,),
                                  Tooltip(
                                      message: "Delete Medicine",
                                      child: IconButton(onPressed: (){}, icon: Icon(Icons.delete,size: 25, color: Colors.red,))),
                                  Spacer(),
                                ],
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
      padding: const EdgeInsets.all(10.0),
      child: Text(text,textAlign: TextAlign.center,style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Colors.black
      ),),
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
      padding: const EdgeInsets.all(10.0),
      child: Text(text,textAlign: TextAlign.center,style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.black
      ),),
    );
  }
}


