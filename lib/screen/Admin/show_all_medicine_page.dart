import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/data/medicine%20data.dart';

class ShowAllMedicinePage extends StatelessWidget {
  const ShowAllMedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                           Heading(text: 'Quantity')
                         ]
                     ):
                     TableRow(
                       children: [
                         Data(text: (index).toString()),
                        Data(text: demoMedicineData[index-1].Medicine_Name) ,
                         Data(text: demoMedicineData[index-1].Quantity.toString())
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


