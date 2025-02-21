import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/labTechController/labTechnicianController.dart';
import 'package:just_medical_center_automation/controller/pharmacistController/pharmacistController.dart';
import 'package:provider/provider.dart';

import '../../responsive.dart';
import '../../widget/common/customButton.dart';

class ChangePasswordLabTechnician extends StatefulWidget {
  const ChangePasswordLabTechnician({super.key});

  @override
  State<ChangePasswordLabTechnician> createState() => _ChangePasswordLabTechnicianState();
}

class _ChangePasswordLabTechnicianState extends State<ChangePasswordLabTechnician> {
  final _key = GlobalKey<FormState>();
  final oldPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LabTechnicianController>(context,listen: true);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.greenAccent.withOpacity(0.4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Change Password',style: Responsive.isDesktop(context) ?
          Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w800,letterSpacing: 2.3):
          Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w800,letterSpacing: 2.3),),
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
                  width: Responsive.isDesktop(context) ? size.width/2.5 :size.width/1.1,
                  child: TextFormField(
                    obscureText: controller.oldPasswordSecure,
                    controller: oldPassword,
                    validator: (val){
                      if(val!.isEmpty)
                      {
                        return "please type old password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(onPressed: (){
                        controller.setOldPasswordSecure();
                      },
                          icon: controller.oldPasswordSecure?Icon(CupertinoIcons.eye_slash):
                          Icon(CupertinoIcons.eye)),
                      border: OutlineInputBorder(),

                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text('New Password: ',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                SizedBox(height: 5,),
                SizedBox(
                  width: Responsive.isDesktop(context) ? size.width/2.5 :size.width/1.1,
                  child: TextFormField(
                    obscureText: controller.newPasswordSecure,
                    controller: newPassword,
                    validator: (val){
                      if(val!.isEmpty || val.length<7)
                      {
                        return "password should be 6 digit";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(onPressed: (){
                          controller.setNewPasswordSecure();
                        },
                            icon: controller.newPasswordSecure?Icon(CupertinoIcons.eye_slash):
                            Icon(CupertinoIcons.eye)),
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text('Confirm Password: ',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),
                SizedBox(height: 5,),
                SizedBox(
                  width: Responsive.isDesktop(context) ? size.width/2.5 :size.width/1.1,
                  child: TextFormField(
                    obscureText: controller.confirmPasswordSecure,
                    controller: confirmPassword,
                    validator: (val){
                      if(newPassword.text != confirmPassword.text)
                      {
                        return "password does not match";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(onPressed: (){
                          controller.setConfirmPasswordSecure();
                        },
                            icon: controller.confirmPasswordSecure?Icon(CupertinoIcons.eye_slash):
                            Icon(CupertinoIcons.eye)),
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
