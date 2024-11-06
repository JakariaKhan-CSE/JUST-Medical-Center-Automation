import 'package:flutter/material.dart';

class AboutDeveloperPage extends StatelessWidget {
  const AboutDeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(title: Text('Developer'),centerTitle: true,),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: size.height*0.3,
                  width: size.width*0.6,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('images/jakaria_l.jpg'),
                          fit: BoxFit.cover
                      )
                  ),

                ),
                SizedBox(height: 20,),
                Text('Md. Jakaria Ibna Azam Khan',style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black
                ),),
                SizedBox(height: 5,),
                Text('Computer Science and Engineering',style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500, color: Colors.blueGrey
                ),),
                SizedBox(height: 5,),
                Text('Jashore University of Science and Technology',style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500, color: Colors.blueGrey
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}