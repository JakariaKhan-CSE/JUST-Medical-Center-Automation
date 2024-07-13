import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class patient_info_prescription extends StatelessWidget {
  const patient_info_prescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Text(
            'Patient Name: ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Text(
            'Md. Jakaria Ibna Azam Khan',
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Gender:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Text(
            'Male',
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Age:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Text(
            '23y',
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Weight:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Text(
            '65 kg',
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
