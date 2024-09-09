import 'package:flutter/material.dart';

import '../../responsive.dart';
class CustomButton extends StatelessWidget {
  final Function() pressed;
  final String btnName;
  const CustomButton({
    super.key,
    required this.pressed, required this.btnName,
  });



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.withOpacity(0.5),
            foregroundColor: Colors.black,
            padding: Responsive.isDesktop(context) ? EdgeInsets.symmetric(horizontal: 120, vertical: 20):
            EdgeInsets.symmetric(horizontal: 40, vertical: 10)
        ),
        onPressed: pressed,
        child: Text(btnName,style: Responsive.isDesktop(context) ? TextStyle(fontSize: 20, fontWeight: FontWeight.w700):
        TextStyle(fontSize: 15, fontWeight: FontWeight.w600),));
  }
}