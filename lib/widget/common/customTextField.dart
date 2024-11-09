import 'package:flutter/material.dart';

import '../../responsive.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController fieldController;
  final TextInputType textInputType;
  final String? Function(String?)? validator;  //final String?(this null important) otherwise return null show error> Function(String?)? validator;
  final bool? obscureText;
  final Widget? suffixIcon;

  const CustomTextField(
      {super.key,
      required this.fieldController,
      required this.label,
      required this.textInputType, this.validator, this.obscureText, this.suffixIcon,
      });

  @override
  Widget build(BuildContext context) {
    // final controller = Provider.of<AdminController>(context, listen: true);
    return Container(
      width: Responsive.isDesktop(context)  ? MediaQuery.of(context).size.width * 0.3:MediaQuery.of(context).size.width -30,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: fieldController,
        obscureText: obscureText??false,
        validator: validator,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
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
