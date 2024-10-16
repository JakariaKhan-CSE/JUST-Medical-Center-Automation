import 'package:flutter/material.dart';

class DashboardPharmacist extends StatefulWidget {
  const DashboardPharmacist({super.key});

  @override
  State<DashboardPharmacist> createState() => _DashboardPharmacistState();
}

class _DashboardPharmacistState extends State<DashboardPharmacist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent.withOpacity(0.2),
      body: Center(child: Text("Dashboard"),),
    );
  }
}
