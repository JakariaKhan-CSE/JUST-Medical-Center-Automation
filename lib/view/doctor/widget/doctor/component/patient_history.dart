import 'package:flutter/material.dart';

class PatientHistory extends StatelessWidget {
  const PatientHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 50)),
          Text('Patient History',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.w600,letterSpacing: 2,wordSpacing: 5),),
          Divider(),
          SizedBox(height: 500,)
        ],
      ),
    );
  }
}