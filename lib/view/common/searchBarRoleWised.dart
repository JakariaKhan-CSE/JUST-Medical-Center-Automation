import 'package:flutter/material.dart';

import '../../responsive.dart';

class SearchBarRoleWise extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final void Function()? onTap;
  const SearchBarRoleWise({
    super.key,
    this.onTap,
    required this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20, top: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.5)),
          child: SizedBox(
            width: Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width / 4
                : MediaQuery.of(context).size.width / 1.7,
            child: TextField(
              style: TextStyle(
                color: Colors.white
              ),
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 7),
                  hintText: hintText,
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.white),
                  border: InputBorder.none),
            ),
          ),
        ),
        Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            child: InkWell(
              onTap: onTap,
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.primary),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ))
      ],
    );
  }
}
