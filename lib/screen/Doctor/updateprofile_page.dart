import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/widget/common/customButton.dart';

class UpdateProfilePage extends StatefulWidget {

  UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final _key = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController specialist = TextEditingController();

  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent.withOpacity(0.3),
body: Center(
  child: SingleChildScrollView(
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
          child: Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(onPressed: (){
              // go to file manager to pickup image
            }, icon: Icon(Icons.camera_alt_outlined)),
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                SizedBox(height: 5,),
                SizedBox(
                  width: size.width/2.5,
                  child: TextFormField(
                    validator: (val){
                      if(val!.isEmpty){
                        return "Enter your name";
                      }
                      return null;
                    },
                controller: name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
            SizedBox(height: 15,),
                Text('Email: ',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                SizedBox(height: 5,),
                SizedBox(
                  width: size.width/2.5,
                  child: TextFormField(
                    validator: (val){
                      if(val!.isEmpty){
                        return "Enter your email";
                      }
                      return null;
                    },
                controller: email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text('Specialist: ',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                SizedBox(height: 5,),
                SizedBox(
                  width: size.width/2.5,
                  child: TextFormField(
                    validator: (val){
                      if(val!.isEmpty){
                        return "Enter your specialist";
                      }
                      return null;
                    },
                controller: specialist,
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text('Description: ',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                SizedBox(height: 5,),
                SizedBox(
                  width: size.width/2.5,
                  child: TextFormField(
                    validator: (val){
                      if(val!.isEmpty){
                        return "Enter your description";
                      }
                      return null;
                    },
                controller: description,
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text('Signature: ',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                SizedBox(height: 5,),
               Stack(
                 children: [
                   Container(
                     height: 60,
                     width: 200,
                     child: Image.asset('images/signature.jpg', fit: BoxFit.cover,),
                   ),
                   Positioned(
                     bottom: 0,
                     child: Container(
                       height: 30,
                       width: 200,
                       color: Colors.grey.withOpacity(0.8),
                       child: IconButton(onPressed: (){
                         // go to file manager to pickup signature image
                       }, icon: Icon(Icons.camera_alt_outlined)),
                     ),
                   )
                 ],
               ),
                SizedBox(height: 30,),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(pressed: (){
                   if(_key.currentState!.validate())
                     {
                       // call update doctor profile functionalities
                     }

                  }, btnName: "Update Profile",
                    backgroundColor: Colors.lightGreen.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
        )
      ],
    ),
  ),
),
    );
  }
}
