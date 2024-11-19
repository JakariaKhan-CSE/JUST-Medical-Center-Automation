import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controller/patientController/imageProvider.dart';
import '../../controller/loginProvider.dart';
import '../../model/req/auth/profileUpdateModel.dart';
import '../../widget/common/customButton.dart';
import '../../widget/common/customTextField.dart';

class PersonalDetails extends StatefulWidget {
  final String role;
  const PersonalDetails({super.key, required this.role});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  //radio group
  // 1 = male and 2 = female
  int _gender = 1;   // when user female select this value setState is 2


  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController ID = TextEditingController();
  TextEditingController Gender = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phone.dispose();
    age.dispose();
    ID.dispose();
    Gender.dispose();
  }
  @override
  Widget build(BuildContext context) {

     final imageUploader = Provider.of<ImageUploader>(context,listen: true);
    return Scaffold(

        body: Consumer<LoginNotifier>(  // LoginNotifier which is provider file(must same this name)
          builder: (context, loginNotifier, child) {  // loginNotifier use any name here
            return Form(
              key: loginNotifier.profileFormKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
                children: [
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text( 'Personal Details', style: TextStyle(fontSize: 25,
                          color: Colors.black, fontWeight: FontWeight.bold)),

                      GestureDetector(
                        onTap: () async {

                          if (imageUploader.imageUrl == null) {

                            // Pick and upload image if none exists
                            await imageUploader.pickImageAndUpload();

                          } else {

                            // Delete image if it already exists
                            await imageUploader.deleteImageFromCloudinary(imageUploader.publicID!);
                          }
                        },
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.lightBlue,
                          backgroundImage: imageUploader.imageUrl != null
                              ? NetworkImage(
                              imageUploader.imageUrl!) // Show uploaded image
                              : null,
                          child: imageUploader.imageUrl == null
                              ? const Icon(Icons.photo_filter_rounded)
                              : null,
                        ),)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Form(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                          fieldController: ID,
                          label: 'ID', textInputType: TextInputType.number,

                      ),
                      const SizedBox(height: 10,),
                      CustomTextField(
                        fieldController: phone,
                        label: 'Phone', textInputType: TextInputType.text,

                      ),
                      const SizedBox(height: 10,),
                      CustomTextField(
                        fieldController: age,
                        label: 'Age', textInputType: TextInputType.number,

                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          // group er je kono akta select hobe 1 (male) 2(female)
                          const Text('Gender: ',style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black
                          ),),
                          const Spacer(),
                          Radio(value: 1, groupValue: _gender, onChanged: (gender) {
                            setState(() {
                              _gender = gender!;
                            });
                          },),
                          const SizedBox(width: 5,),
                          const Text('Male',style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black
                          ),),
                          const SizedBox(width: 15,),
                          Radio(value: 2, groupValue: _gender, onChanged: (gender) {
                            setState(() {
                              _gender = gender!;
                            });
                          },),
                          const SizedBox(width: 5,),
                          const Text('Female',style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black
                          ),),
                        ],),
                      const SizedBox(height: 10,),

                      const SizedBox(height: 20,),
                      Consumer<ImageUploader>(builder: (context, imageUploader, child) {
                        return Align(
                          alignment: Alignment.center,
                          child: CustomButton(pressed: (){
                            if(imageUploader.imageUrl == null)
                            {
                              Get.snackbar("Image Missing", "Please upload an image to proceed",
                                  colorText: Colors.white,
                                  backgroundColor: Colors.orange,
                                  icon: const Icon(Icons.add_alert)
                              );
                            }else  if(loginNotifier.profileValidation())
                              {
                                ProfileUpdateModel model = ProfileUpdateModel(
                                    ID: int.parse(ID.text),
                                    age: int.parse(age.text),
                                    gender: _gender==1 ? "male" : "female",
                                    phone: phone.text,
                                    profile: imageUploader.imageUrl??"https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                                    role: widget.role,
                                  isUpdatedProfile: true
                                );

                                // call update profile function
                                loginNotifier.updateProfile(model);
                              }
                            }
                          , btnName: 'Update Profile',backgroundColor: Colors.cyan,),
                        );
                      },)
                    ],
                  ))
                ],
              ),
            );
          },)
    );
  }
}