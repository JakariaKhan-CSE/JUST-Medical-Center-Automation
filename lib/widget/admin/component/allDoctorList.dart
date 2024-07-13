import 'package:flutter/material.dart';

import 'itemView.dart';

class allDoctorList extends StatelessWidget {
  const allDoctorList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.8,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) => itemView(
          imagePath: 'images/doctor2.jpg',
          name: 'Jakaria Khan',
          degree: 'MBBS, FCPS',
        ),
      ),
    );
  }
}
