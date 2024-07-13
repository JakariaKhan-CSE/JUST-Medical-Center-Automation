import 'package:flutter/material.dart';

class prescription_left_side extends StatelessWidget {
  const prescription_left_side({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cheif Complaints:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              'improving',
              style: TextStyle(fontSize: 13),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            Text(
              'Diagnosis: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'under evaluation',
              style: TextStyle(fontSize: 13),
            ),
          ],
        ));
  }
}
