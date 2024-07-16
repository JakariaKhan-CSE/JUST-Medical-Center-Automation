import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController fieldController;
  final TextInputType textInputType;
  const CustomTextField({
    super.key,
    required this.fieldController, required this.label, required this.textInputType
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: fieldController,
        validator: (value) {
          if (value!.isEmpty) {
            return "$label is required";
          }
        },
        decoration: InputDecoration(
            label: Text(
              label,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            hintText: 'Enter $label',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}