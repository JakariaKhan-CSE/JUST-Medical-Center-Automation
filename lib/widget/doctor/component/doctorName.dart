import 'package:flutter/material.dart';

class doctorName extends StatelessWidget {
  final String doctorname;
  const doctorName({
    super.key, required this.doctorname,
  });

  @override
  Widget build(BuildContext context) {
    return  Text('$doctorname',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),);
  }
}