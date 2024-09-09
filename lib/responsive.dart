import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;

  final Widget desktop;
  const Responsive({super.key, required this.mobile, required this.desktop});

  static bool isMobile(BuildContext context)=>
      MediaQuery.of(context).size.width<=1040;



  static bool isDesktop(BuildContext context)=>
      MediaQuery.of(context).size.width>1040;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if(size.width>=1040) {
      return desktop;
    }
    else{
      return mobile;
    }

  }
}