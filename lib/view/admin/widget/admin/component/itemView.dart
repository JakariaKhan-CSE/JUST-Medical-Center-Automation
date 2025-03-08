import 'package:flutter/material.dart';

import '../../../../../responsive.dart';
class itemView extends StatelessWidget {
  final String imagePath;
  final String name;
  final String? degree;
  const itemView({
    super.key, required this.imagePath, required this.name, this.degree,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width:Responsive.isDesktop(context)? 400:250,
       decoration: BoxDecoration(
         color: Colors.blueGrey.withAlpha(100),
         borderRadius: BorderRadius.circular(10)
       ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Responsive.isDesktop(context)?
              SizedBox(
                width: 10,
              ): SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,style:Responsive.isDesktop(context)?
                      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700):
                      TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),maxLines: 1,overflow: TextOverflow.ellipsis,),
                      if(Responsive.isDesktop(context))
                      SizedBox(
                        height: 5,
                      ),
                      Text(degree??'',style: Responsive.isDesktop(context)?
                      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500):
                      TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400),maxLines: 2,overflow: TextOverflow.ellipsis,)
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}