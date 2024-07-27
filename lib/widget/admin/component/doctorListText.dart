import 'package:flutter/material.dart';

class listText extends StatelessWidget {
  final String listName;
  final Function() onTap;

  const listText({
    super.key, required this.listName, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(listName,style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w600), ),
        InkWell(
            onTap: onTap,
            child: Text('See all',style: TextStyle(color: Colors.blue, fontSize: 26),))
      ],
    );
  }
}