import 'package:flutter/material.dart';

import '../../pharmacist/widget/EachCardShow.dart';

class TotalNumberAllElement extends StatelessWidget {
  final int doctor;
  final int pharmacist;
  final int patient;
  final int medicine;
  const TotalNumberAllElement({
    super.key,
    required this.height,
    required this.width, required this.doctor, required this.pharmacist, required this.patient, required this.medicine,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            EachPartCard(
              height: height,
              width: width,
              text: 'Total Patient',
              number: patient.toString(),
            ),
            SizedBox(
              height: 20,
            ),
            EachPartCard(
              height: height,
              width: width,
              text: 'Total Doctor',
              number: doctor.toString(),
            ),
            // total medicine of month

            // EachPartCard(
            //   height: height,
            //   width: width,
            //   text: 'Total Medicine',
            //   number: medicine.toString(),
            // ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        // total medicine of month
        Column(
          children: [

            // SizedBox(
            //   height: 20,
            // ),
            EachPartCard(
              height: height,
              width: width,
              text: 'Total Pharmacist',
              number: pharmacist.toString(),
            ),
          ],
        )
      ],
    );
  }
}