import 'package:flutter/material.dart';

import '../../../../../responsive.dart';


class listText extends StatelessWidget {
  final String listName;
  final Function() onTap;

  const listText({
    super.key,
    required this.listName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          listName,
          style: Responsive.isDesktop(context)
              ? Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.w600)
              : Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w400),
        ),
        InkWell(
            onTap: onTap,
            child: Text(
              'See all',
              style: Responsive.isDesktop(context)
                  ? TextStyle(color: Colors.blue, fontSize: 26)
                  : TextStyle(color: Colors.blue, fontSize: 16),
            ))
      ],
    );
  }
}
