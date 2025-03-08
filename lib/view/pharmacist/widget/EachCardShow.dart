import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../responsive.dart';

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

  String formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)} M';
    } else if (number >= 10000) {  //  || number >=1000
      return '${(number / 1000).toStringAsFixed(0)} K';
    } else if (number < 1000) {
      return number.toString();
    } else {
      return number.toString(); // This case is for numbers between 1000 and 9999
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:Responsive.isDesktop(context)? height*0.16: (height/5)-10,
      width:Responsive.isDesktop(context)? width*0.2 : (width/2)-20,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatNumber(int.tryParse(number)??0),style: Responsive.isDesktop(context)? Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700):
                Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),),
                SizedBox(width: 3,),
                Icon(CupertinoIcons.triangle_fill,color: Colors.yellowAccent,size: 16,)
              ],
            ),
            SizedBox(height: 10,),
            Text(text,style: Responsive.isDesktop(context)? Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,letterSpacing: 1.9):
            Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w500,letterSpacing: 1.5),),
          ],
        ),
      ),
    );
  }
}