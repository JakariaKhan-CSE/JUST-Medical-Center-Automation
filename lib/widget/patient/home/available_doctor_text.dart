import 'package:flutter/material.dart';

class available_doctor_text extends StatelessWidget {
  const available_doctor_text({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Available Doctors in online',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Expanded(child: Container()),
        GestureDetector(
            onTap: () {},
            child: Text(
              'see all',
              style: TextStyle(fontSize: 18, color: Colors.blue),
            )),
      ],
    );
  }
}
