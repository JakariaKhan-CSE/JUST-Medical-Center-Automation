import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:just_medical_center_automation/screen/auth/login_page.dart';
import 'package:just_medical_center_automation/screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3)); // Splash screen delay
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool('loggedIn') ?? false;
    final role = prefs.getString('role') ?? 'patient';

    if (loggedIn) {
      // Navigate to the MainScreen based on role
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen(role: role)),
      );
    } else {
      // Navigate to LoginPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Animate(
                  effects: const [
                    FadeEffect(duration: Duration(milliseconds: 1500)),
                    ScaleEffect(duration: Duration(milliseconds: 1500)),
                  ],
                  child: Image.asset('images/home picture.jpg',width: MediaQuery.of(context).size.width ), // 100% of screen width,
                ),
                SizedBox(height: 30,),
               // inherits the delay & duration from move
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("JUST Medical Center",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w800,
                      letterSpacing: 1.6,
                      color: Colors.white
                              ),).animate()
                      .fade(duration: 2500.ms)
                      .scale(delay: 500.ms),
                ) ,// runs after fade.
                // SizedBox(height: 30,),
                // CircularProgressIndicator(
                //   color: Theme.of(context).primaryColor,
                //   strokeWidth: 2,
                // ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
