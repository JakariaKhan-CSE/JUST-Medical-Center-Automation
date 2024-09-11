import 'package:flutter/material.dart';

class doctorPicture extends StatelessWidget {
  const doctorPicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 1.5,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage('images/doctor1.jpg'))
        ),
      )
    );
  }
}