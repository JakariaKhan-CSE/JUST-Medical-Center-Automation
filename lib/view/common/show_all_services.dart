import 'package:flutter/material.dart';
import '../../services/allDataService.dart';

class ShowAllServicesPage extends StatelessWidget {
  const ShowAllServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    In your PatientScreen's initState, you're fetching data but not waiting for it to complete. This may cause the data to not be available when the ShowAllServicesPage is displayed.

Solution:

Use a FutureBuilder in the ShowAllServicesPage to wait for data to load.
     */
    return FutureBuilder(
      future: AllDataServices().getDataFromFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
else{

          final servicesData = AllDataServices.servicesData;

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'All Services List',
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: ListView.builder(
                      itemCount: servicesData.length + 1,
                      itemBuilder: (context, index) {
                        return Table(
                          columnWidths: {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(4),
                            2: FlexColumnWidth(2),
                          },
                          border: TableBorder.all(color: Colors.black54, width: 1.0),
                          children: [
                            index == 0
                                ? const TableRow(children: [
                              Heading(text: 'No'),
                              Heading(text: 'Test'),
                              Heading(text: 'Rate'),
                            ])
                                : TableRow(children: [
                              Data(text: index.toString()),
                              Data(text: servicesData[index - 1].testName),
                              Data(text: '${servicesData[index - 1].rate}/-'),
                            ]),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
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

