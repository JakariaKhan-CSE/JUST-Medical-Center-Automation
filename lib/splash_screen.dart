import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Timer(const Duration(seconds: 4), ()=>
    //     Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (ctx)=>const HomePage()))
    // );

    // this page(Successfully work) goes when need to csv file full data to store firebase
    // Timer(const Duration(seconds: 4), ()=>Navigator.
    // pushReplacement(context, MaterialPageRoute(
    //     builder: (ctx)=>const Csvfileaddfirebase())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Animate(
            effects: const [FadeEffect(duration: Duration(milliseconds: 1500)),ScaleEffect(duration: Duration(milliseconds: 1500))],
            child: Image.asset('assets/images/splash_screen.png'),
          )
      ),
    );
  }
}