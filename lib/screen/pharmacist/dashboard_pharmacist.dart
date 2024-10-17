import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPharmacist extends StatefulWidget {
  const DashboardPharmacist({super.key});

  @override
  State<DashboardPharmacist> createState() => _DashboardPharmacistState();
}

class _DashboardPharmacistState extends State<DashboardPharmacist> {
  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;
    return Scaffold(
      backgroundColor: Colors.purpleAccent.withOpacity(0.2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.home,size: 36,color: Colors.black,),
              SizedBox(width: 15,),
              Text('Dashboard',style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700,
              color: Colors.black,letterSpacing: 1.4),)
            ],
          ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 55),
                child: Text('Home',style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600,
                    color: Colors.black,letterSpacing: 1.3),),
              ),
              SizedBox(height: 20,),
              Divider(color: Colors.blue,thickness: 1.5,),
              SizedBox(height: 20,),
Container(
  height: height*0.16,
  width: width*0.2,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: Colors.grey.withOpacity(0.6),
    border: Border.all(color: Colors.yellowAccent)
  ),
)

              // SizedBox(height: 20,),
              // Divider(color: Colors.blue,thickness: 1.5,),
              // SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
