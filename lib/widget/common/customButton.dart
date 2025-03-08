import 'package:flutter/material.dart';

import '../../responsive.dart';
class CustomButton extends StatelessWidget {
  final Function() pressed;
  final String btnName;
  final Color? backgroundColor;
  final Color? foregroundColor;
  const CustomButton({
    super.key,
    required this.pressed, required this.btnName, this.backgroundColor, this.foregroundColor,
  });



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(50),
            backgroundColor: backgroundColor ?? Colors.grey.withOpacity(0.5), // define  kore na dile automatic grey color hobe
            foregroundColor:foregroundColor?? Colors.black, // foregroundColor null hole black set hobe
            padding: Responsive.isDesktop(context) ? EdgeInsets.symmetric(horizontal: 120, vertical: 20):
            EdgeInsets.symmetric(horizontal: 20, vertical: 5)
        ),
        onPressed: pressed,
        child: Text(btnName,style: Responsive.isDesktop(context) ? TextStyle(fontSize: 20, fontWeight: FontWeight.w700):
        TextStyle(fontSize: 14, fontWeight: FontWeight.w400),));
  }
}