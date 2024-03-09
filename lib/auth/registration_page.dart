import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/auth/login.dart';
import 'package:just_medical_center_automation/main.dart';
class RegistrationPage extends StatefulWidget {

   RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String? name;
  String? email;
  String? password;
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  bool secure = true;
  bool secure2 = true;

 void register()async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    final User? user = (await firebaseAuth.createUserWithEmailAndPassword(email: email!, password: password!)).user;
 if(user != null)
   {
     Navigator.push(context, MaterialPageRoute(builder: (ctx)=>HomePage()));
   }
 else{
   print('Error Occur>>>');
 }
 }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('Registration'),centerTitle: true,),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TextFormField(
                //   controller: _nameController,
                //   keyboardType: TextInputType.text,
                //   decoration: InputDecoration(
                //       prefixIcon: Icon(Icons.people_alt),
                //       labelText: "Name",
                //       hintText: 'Enter your full name',
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30)
                //       )
                //   ),
                //   validator: (value){
                //     if(value!.isEmpty)
                //     {
                //       return "Please enter your name";
                //     }
                //
                //   },
                //
                // ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: "Email",
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty)
                    {
                      return "Please enter your email";
                    }

                  },

                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: _passwordController,
                  obscureText: secure,
                  obscuringCharacter: '*',
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(onPressed: (){

                        setState(() {
                          secure = !secure;

                        });

                      },icon: Icon(secure?Icons.remove_red_eye:Icons.remove_red_eye_outlined),),
                      labelText: "Password",
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty)
                    {
                      return "Please enter your password";
                    }

                  },

                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: _confirmpasswordController,
                  obscureText: secure2,
                  obscuringCharacter: '*',
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(onPressed: (){

                        setState(() {
                          secure2 = !secure2;

                        });

                      },icon: Icon(secure2?Icons.remove_red_eye:Icons.remove_red_eye_outlined),),
                      labelText: "Retype-Password",
                      hintText: 'Enter your confirm password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty)
                    {
                      return "Please enter your confirm password";
                    }
                    else if(_confirmpasswordController.text != _passwordController.text)
                      {
                        return 'Password does not match';
                      }

                  },

                ),
                SizedBox(height: 40,),
                SizedBox(
                  width: (double.infinity),
                  height: 40,
                  child: ElevatedButton(onPressed: (){

                  //  name = _nameController.text;
                    email = _emailController.text;
                    password = _passwordController.text;
if(_formkey.currentState!.validate())
  {
    register();  //register function calling
    print('true is true');
  }


//name = '';
email= '';
password = '';
//_nameController.clear();
_emailController.clear();
_passwordController.clear();
_confirmpasswordController.clear();
                  },child: Text('Sign Up',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),),),
                ),
                SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account',style: TextStyle(
                    fontSize: 16.5
                  ),),
                  TextButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (ctx)=>LoginPage()));
                  }, child: Text('Login',style: TextStyle(
                      fontSize: 16.5
                  )))
                ],
              )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
