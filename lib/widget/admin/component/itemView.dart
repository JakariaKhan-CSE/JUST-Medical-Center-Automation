import 'package:flutter/material.dart';
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
        width: 400,
       decoration: BoxDecoration(
         color: Colors.blueGrey,
         borderRadius: BorderRadius.circular(15)
       ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),maxLines: 1,overflow: TextOverflow.ellipsis,),
                      SizedBox(
                        height: 5,
                      ),
                      Text(degree??'',style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),maxLines: 2,overflow: TextOverflow.ellipsis,)
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}