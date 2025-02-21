
import 'package:flutter/material.dart';

class PatientProfileRow extends StatelessWidget {
  final String leading;
  final String title;

  PatientProfileRow({
    super.key, required this.leading, required this.title,
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
              flex: 6,
              child: Text(title,overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 15, color: Colors.black))),

        ],
      ),
    );
  }
}
