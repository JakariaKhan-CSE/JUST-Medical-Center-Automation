import 'package:flutter/material.dart';
class NewHomePage extends StatelessWidget {
  var user;
   NewHomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Text('Welcome ${user}'),
      ),
    ));
  }
}
