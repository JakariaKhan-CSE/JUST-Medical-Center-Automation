import 'package:flutter/material.dart';

class adminPicture extends StatelessWidget {
  const adminPicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 1.5,
      child: CircleAvatar(
        radius: 50,
        child: Image.asset('images/admin.jpg'),
      ),
    );
  }
}