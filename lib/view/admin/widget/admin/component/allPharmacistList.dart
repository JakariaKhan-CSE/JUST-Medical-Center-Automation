import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/model/res/admin/every_role_response.dart';
import 'package:just_medical_center_automation/model/res/admin/pharmacist_response.dart';


import '../../../../../responsive.dart';
import 'itemView.dart';

class allHorizontalPharmacistList extends StatelessWidget {
  // final List<Map<String, dynamic>> data;
  final List<PharmacistRes> data;
  const allHorizontalPharmacistList({
    super.key, required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isDesktop(context) ? 5: 4,
      child: SizedBox(
        // height: MediaQuery.of(context).size.height / 2.8,
        child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final singleData = data[index];
            return itemView(

              imagePath: singleData.profile??'https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg',
              name: singleData.name??'Unknown',
              degree: 'MBBS',
            );
          },
        ),
      ),
    );
  }
}
