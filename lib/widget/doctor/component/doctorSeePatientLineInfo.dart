import 'package:flutter/material.dart';

import '../../../responsive.dart';


class doctorSeePatientLineInfo extends StatelessWidget {
  final String name;
  final String value;

  const doctorSeePatientLineInfo({
    super.key,
    required this.name, required this.value,
  });



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$name : ",
          style: Responsive.isDesktop(context) ? Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700):
          Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w700),),

        Text('${value}',style: Responsive.isDesktop(context) ? Theme.of(context).textTheme.headlineSmall:
        Theme.of(context).textTheme.labelMedium,)
      ],
    )
    ;
  }
}