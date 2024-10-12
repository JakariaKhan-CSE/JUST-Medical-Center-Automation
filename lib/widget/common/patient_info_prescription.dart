import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class patient_info_prescription extends StatelessWidget {
  const patient_info_prescription({
    super.key,
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
          'Md. Jakaria Ibna Azam Khan',
          style: TextStyle(fontSize: 13),
        ),
        Spacer(),
        Text(
          'Gender:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        Text(
          'Male',
          style: TextStyle(fontSize: 13),
        ),
        Spacer(),

        Text(
          'Age:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        Text(
          '23y',
          style: TextStyle(fontSize: 13),
        ),
        Spacer(),
        // Text(
        //   'Weight:',
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        // ),
        // Text(
        //   '65 kg',
        //   style: TextStyle(fontSize: 13),
        // ),
      ],
    );
  }
}
