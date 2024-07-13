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
        color: Colors.blueGrey,
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
                  child: DefaultTextStyle(
                    style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name),
                        SizedBox(
                          height: 5,
                        ),
                        Text(degree??'')
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}