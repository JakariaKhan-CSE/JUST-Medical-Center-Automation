import 'package:flutter/material.dart';

class PrescriptionDesignContainer extends StatelessWidget {
  const PrescriptionDesignContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dr. Jakaria Khan',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            'MBBS',
            style:
                TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.7)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dermatology, General Physician',
                style: TextStyle(
                    fontSize: 13, color: Colors.black.withOpacity(0.7)),
              ),
              Text(
                'Date: 8 April 2024',
                style: TextStyle(
                    fontSize: 15, color: Colors.black.withOpacity(0.7)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'BMDC Reg No - 87794',
                style: TextStyle(
                    fontSize: 15, color: Colors.black.withOpacity(0.7)),
              ),
              Text(
                'Ref: h455d65',
                style: TextStyle(
                    fontSize: 15, color: Colors.black.withOpacity(0.7)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
