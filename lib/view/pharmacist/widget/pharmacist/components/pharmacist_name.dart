import 'package:flutter/material.dart';

class PharmacistInfo extends StatelessWidget {
  final String pharmacistName;
  final String imageLink;
  const PharmacistInfo({super.key, required this.pharmacistName, required this.imageLink});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(aspectRatio: 1.5,
            child: CircleAvatar(
                radius: 100,
                child:  Image.network(imageLink,fit: BoxFit.cover,))
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
