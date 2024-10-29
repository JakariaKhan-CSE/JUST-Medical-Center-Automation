import 'package:flutter/material.dart';

import '../../../responsive.dart';
class TodayReport extends StatelessWidget {
  const TodayReport({
    super.key,
    required this.height,
    required this.width, required this.number,
  });


  final String number;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  Responsive.isDesktop(context)? height*0.34:height*0.34,
      width: Responsive.isDesktop(context)? width*0.4 : width-50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.4),
          border: Border.all(color: Colors.yellowAccent)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text("Today's Report",style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w700),),
            Spacer(),
            Container(
              padding: EdgeInsets.all(12),
              color: Colors.grey.shade200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Medicine : ",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),),
                  Text(number,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w300,
                      color: Colors.blue
                  ))


                ],
              ),
            ),
            Spacer(),
            Spacer(),
            Spacer(),

          ],
        ),
      ),
    );
  }
}