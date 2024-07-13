import 'package:flutter/material.dart';

class listDoctorText extends StatelessWidget {
  const listDoctorText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('List all doctor',style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w600), ),
        InkWell(
            onTap: (){

            },
            child: Text('See all',style: TextStyle(color: Colors.blue, fontSize: 26),))
      ],
    );
  }
}