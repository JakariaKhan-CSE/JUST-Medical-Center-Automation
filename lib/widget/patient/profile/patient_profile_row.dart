
import 'package:flutter/material.dart';

class PatientProfileRow extends StatelessWidget {
  final String leading;
  final String title;
  IconData? icon;
  PatientProfileRow({
    super.key, required this.leading, required this.title,this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                leading,
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              )),
          Expanded(
              flex: 5,
              child: Text(title,
                  style: const TextStyle(fontSize: 15, color: Colors.black))),
          Expanded(
              child: Icon(
            icon??Icons.arrow_forward_ios, // aitar value na dile(null hole) aita nibe
            size: 20,
          ))
        ],
      ),
    );
  }
}
