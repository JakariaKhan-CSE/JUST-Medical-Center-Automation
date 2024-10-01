import 'package:flutter/material.dart';

import '../../widget/common/customButton.dart';

class DoctorPasswordChange extends StatefulWidget {
  const DoctorPasswordChange({super.key});

  @override
  State<DoctorPasswordChange> createState() => _DoctorPasswordChangeState();
}

class _DoctorPasswordChangeState extends State<DoctorPasswordChange> {
  final _key = GlobalKey<FormState>();
  final oldPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
backgroundColor: Colors.greenAccent.withOpacity(0.4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Change Password',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w800,letterSpacing: 2.3),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Divider(height: 2,color: Colors.black,),
          ),
          SizedBox(height: 30,),
          Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Old Password: ',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                SizedBox(height: 5,),
                SizedBox(
                  width: size.width/2.5,
                  child: TextFormField(
                    controller: oldPassword,
                    validator: (val){
                      if(val!.isEmpty)
                        {
                          return "please type old password";
                        }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),

                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text('New Password: ',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                SizedBox(height: 5,),
                SizedBox(
                  width: size.width/2.5,
                  child: TextFormField(
                    controller: newPassword,
                    validator: (val){
                      if(val!.isEmpty || val.length<7)
                        {
                          return "password should be 6 digit";
                        }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text('Confirm Password: ',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                SizedBox(height: 5,),
                SizedBox(
                  width: size.width/2.5,
                  child: TextFormField(
                    controller: confirmPassword,
                    validator: (val){
                      if(newPassword.text != confirmPassword.text)
                      {
                        return "password does not match";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 30,),
          Align(
            alignment: Alignment.center,
            child: CustomButton(pressed: (){

if(_key.currentState!.validate())
  {
    // at first check old password correct or not then change password

  }
            }, btnName: "Change Password",
              backgroundColor: Colors.teal.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
