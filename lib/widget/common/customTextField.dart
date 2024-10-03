import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/adminController/adminController.dart';
import 'package:provider/provider.dart';

import '../../responsive.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController fieldController;
  final TextInputType textInputType;

  const CustomTextField(
      {super.key,
      required this.fieldController,
      required this.label,
      required this.textInputType,
      });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AdminController>(context, listen: true);
    return Container(
      width: Responsive.isDesktop(context)  ? MediaQuery.of(context).size.width * 0.3:MediaQuery.of(context).size.width -30,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: fieldController,

        validator: (value) {
          if (value!.isEmpty) {
            return "$label is required";
          }
          return null;
        },
        decoration: InputDecoration(

            label: Text(
              label,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            hintText: 'Enter $label',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
