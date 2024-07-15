import 'package:flutter/material.dart';

import 'itemView.dart';

class allHorizontalList extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  const allHorizontalList({
    super.key, required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.8,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) => itemView(
          imagePath: data[index]['img'],
          name: data[index]['name'],
          degree: data[index]['department'] ?? '',
        ),
      ),
    );
  }
}
