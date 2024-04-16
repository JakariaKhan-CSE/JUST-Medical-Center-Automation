import 'package:flutter/material.dart';

import '../../../data/doctorData.dart';

class doctorListbuilder extends StatelessWidget {
  const doctorListbuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: DoctorData.data.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> singleData = DoctorData.data[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        singleData['img'],
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          singleData['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        // SizedBox(height: 5,),
                        Text(
                          singleData['department'],
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
