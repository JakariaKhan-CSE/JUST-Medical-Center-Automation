import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController department = TextEditingController();
  SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent.withOpacity(0.3),
body: Center(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('Update Profile',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w800,letterSpacing: 2.3),),
      SizedBox(height: 10,),
      Padding(
  padding: const EdgeInsets.symmetric(horizontal: 30),
  child: Divider(height: 2,color: Colors.black,),
),
      SizedBox(height: 30,),
      CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('images/doctor2.jpg'),
        child: IconButton(onPressed: (){
          // go to file manager to pickup image
        }, icon: Icon(Icons.camera_alt_outlined)),
      ),
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Name: ',style: Theme.of(context).textTheme.bodyMedium,),
            SizedBox(width: 10,),
            SizedBox(
              width: 400,
              child: TextField(

                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
            )
          ],
        ),
      )
    ],
  ),
),
    );
  }
}
