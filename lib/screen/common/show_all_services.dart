import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/data/servicesData.dart';

class ShowAllServicesPage extends StatelessWidget {
  const ShowAllServicesPage({super.key});

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
              child: Text('All Services List',style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),),

            ),
            const SizedBox(height: 30,),
            Expanded(
              child: ListView.builder(
                itemCount: allServicesData.length+1,
                itemBuilder: (context, index) {
                  return Table(
                    // defaultColumnWidth: IntrinsicColumnWidth(), //automatically adjust kore nibe but aktu elomelo hoyejabe
                    //you can use a different width for each column.
                    columnWidths: {  // very useful
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(4),
                      2: FlexColumnWidth(2),
                    },
                    textDirection: TextDirection.ltr,
                    border: TableBorder.all(color: Colors.black54, width: 1.0),
                    children: [
                      index==0?  const TableRow(
                          children:[
                            Heading(text: 'No',),
                            Expanded(child: Heading(text: 'Test')),
                            Heading(text: 'Rate')
                          ]
                      ):
                      TableRow(
                          children: [
                            Data(text: (index).toString()),
                            Expanded(child: Data(text: allServicesData[index-1].testName)) ,
                            Data(text: '${allServicesData[index-1].rate.toString()}/-')
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
      child: Text(text,textAlign: TextAlign.center,style: const TextStyle(
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
      child: Text(text,textAlign: TextAlign.center,style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.black
      ),),
    );
  }
}

