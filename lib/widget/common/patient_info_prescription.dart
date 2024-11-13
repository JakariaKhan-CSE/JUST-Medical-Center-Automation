import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../responsive.dart';

class patient_info_prescription extends StatelessWidget {
  final String? patientName;
  final String? gender;
  final String? age;
  final String? ID;

  const patient_info_prescription({
    super.key, required this.patientName, required this.gender, required this.age, required this.ID,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Patient Name: ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        Text(
          patientName!,
          style: TextStyle(fontSize: 13),

        ),
        Spacer(),
        if(Responsive.isDesktop(context))
        Text(
          'Gender:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        if(Responsive.isDesktop(context))
        Text(
          gender!,
          style: TextStyle(fontSize: 13),
        ),
        Spacer(),

        Text(
          'Age:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        Text(
          '${age}y',
          style: TextStyle(fontSize: 13),
        ),
        // Spacer(),
        // if(Responsive.isDesktop(context))
        // Text(
        //   'Weight:',
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        // ),
        // if(Responsive.isDesktop(context))
        // Text(
        //   '65 kg',
        //   style: TextStyle(fontSize: 13),
        // ),
      ],
    );
  }
}
