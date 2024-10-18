import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EachPartCard extends StatelessWidget {
  final String text;
  final String number;
  const EachPartCard({
    super.key,
    required this.height,
    required this.width, required this.text, required this.number,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height*0.16,
      width: width*0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.withOpacity(0.5),
          border: Border.all(color: Colors.yellowAccent)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(number,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),),
                SizedBox(width: 3,),
                Icon(CupertinoIcons.triangle_fill,color: Colors.yellowAccent,size: 16,)
              ],
            ),
            SizedBox(height: 10,),
            Text(text,style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,letterSpacing: 1.9),),
          ],
        ),
      ),
    );
  }
}