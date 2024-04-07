
import 'package:flutter/material.dart';

class PatientProfileRow extends StatelessWidget {
  final String leading;
  final String title;
  IconData? icon = Icons.arrow_forward_ios;
  PatientProfileRow({
    super.key, required this.leading, required this.title,this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
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
          icon,
          size: 20,
        ))
      ],
    );
  }
}
