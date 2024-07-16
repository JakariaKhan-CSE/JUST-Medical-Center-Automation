import 'package:flutter/material.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20)
        ),
        onPressed: pressed,
        child: Text(btnName,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),));
  }
}