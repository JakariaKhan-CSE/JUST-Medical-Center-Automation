import 'package:flutter/material.dart';

class doctors_all_text extends StatelessWidget {
  const doctors_all_text({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Doctors',
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
