import 'package:flutter/material.dart';

class PharmacistInfo extends StatelessWidget {
  final String pharmacistName;
  const PharmacistInfo({super.key, required this.pharmacistName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(aspectRatio: 1.5,
            child: CircleAvatar(
                radius: 100,
                child:  Image.network('https://cdn-icons-png.flaticon.com/512/1560/1560896.png',fit: BoxFit.cover,))
        ),

        const SizedBox(height: 20,),
        // show doctor name here
        Text(pharmacistName, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),),
        const SizedBox(height: 20,),
        const Divider(),
        const SizedBox(height: 30,),
      ],
    );
  }
}