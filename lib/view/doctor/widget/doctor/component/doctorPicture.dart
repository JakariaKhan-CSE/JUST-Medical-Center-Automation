import 'package:flutter/material.dart';

class doctorPicture extends StatelessWidget {
  final String image;
  const doctorPicture({
    super.key, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 1.5,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)
        ),
      )
    );
  }
}