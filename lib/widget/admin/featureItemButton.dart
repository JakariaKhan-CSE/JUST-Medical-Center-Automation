import 'package:flutter/material.dart';
class featureItem extends StatelessWidget {
  final Function() onTap;
  final String featureName;
  const featureItem({
    super.key, required this.onTap, required this.featureName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
mouseCursor: MaterialStateMouseCursor.clickable,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.blueGrey
            ,borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text(featureName,style: TextStyle(
            color: Colors.white, fontSize: 18
        ),)),
      ),
    );
  }
}