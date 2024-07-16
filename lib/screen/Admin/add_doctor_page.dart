import 'package:flutter/material.dart';

import '../../widget/common/customButton.dart';
import '../../widget/common/customTextField.dart';

class AddDoctorPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conformPasswordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  AddDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.deepPurple.withOpacity(0.1),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Row(
                children: [
                  Spacer(),
                  Column(

                    children: [
                      Text('Added New Doctor',style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 60,),
                      CustomTextField(label: 'Doctor Name', fieldController: nameController,),
                      SizedBox(height: 20,),
                      CustomTextField(fieldController: emailController, label: 'Email'),
                      SizedBox(height: 20,),
                      CustomTextField(fieldController: passwordController, label: 'Password'),
                      SizedBox(height: 20,),
                      CustomTextField(fieldController: conformPasswordController, label: 'Confirm Password'),
                      SizedBox(height: 40,),
                      CustomButton(btnName: 'Submit',pressed: (){
                        if(_formkey.currentState!.validate())
                          {
print('form is valid');
print(nameController.text);
                          }
                      },),

                    ],
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
        ));
  }
}




