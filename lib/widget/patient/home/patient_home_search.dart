import 'package:flutter/material.dart';

class PatientHomeSearch extends StatelessWidget {
  const PatientHomeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.deepOrange.withOpacity(0.09)),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Search for a doctor'),
          ),
        ),
        Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.deepPurple),
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}
