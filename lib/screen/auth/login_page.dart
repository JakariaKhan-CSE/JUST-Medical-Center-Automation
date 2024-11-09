import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_medical_center_automation/screen/auth/signUpPage.dart';
import 'package:provider/provider.dart';

import '../../controller/loginProvider.dart';
import '../../widget/common/customButton.dart';
import '../../widget/common/customTextField.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {  // dispose use for release memory
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, loginNotifier, child) {
        loginNotifier.getPrefs();
        // print(loginNotifier.loggedIn);
        return Scaffold(

          appBar: PreferredSize(preferredSize: const Size.fromHeight(50),
            child: AppBar(title: Text('Login'),

            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: loginNotifier.loginFormKey,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const SizedBox(height: 50,),
                  const Text( 'Welcome Back!', style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600, color: Colors.black)),
                  const Text( 'Fill the details to login to your account', style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  )),
                  const SizedBox(height: 50,),
                  CustomTextField(
                    fieldController: email,
                    label: "Email",
                    textInputType: TextInputType.emailAddress,

                    validator: (email){
                      if(email!.isEmpty || !email.contains("@") )  // email filed jodi empty hoi and @ na thake tahole invalid message return korbe
                          {
                        return "Please enter a valid email";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  CustomTextField(
                    fieldController: password,
                    label: "Password",
                    textInputType: TextInputType.text,
                    validator: (password){
                      if(password!.isEmpty || password.length<6)  // email filed jodi empty hoi and @ na thake tahole invalid message return korbe
                          {

                        return "Please enter at least 6 digit password";
                      }
                      return null;
                    },
                    obscureText: loginNotifier.obsecureText,
                    suffixIcon: GestureDetector(
                      onTap: (){
                        loginNotifier.obsecureText = !loginNotifier.obsecureText;
                      },
                      child:loginNotifier.obsecureText ? const Icon(Icons.visibility_off,color: Colors.black,) : const Icon(Icons.visibility,color: Colors.black,),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      // Get.offAll use koresi jeno login page ba signup age theke back korle onno page a na jai karon login, signup page e jawar jonno already button deya ase
                      onTap: ()=>Get.offAll(const signUpPage()),
                      child: const Text("Register",style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  CustomButton(btnName: 'Login',
                      pressed: (){



                        // i get form (null) error so i comment out this code
                        // if(loginNotifier.validateAndSave())
                        // {
                        //   LoginModel model = LoginModel(
                        //       email: email.text,
                        //       password: password.text);
                        //   loginNotifier.userLogin(model);
                        // }
                        // else{
                        //   Get.snackbar("Sign Failed",
                        //       "Please fill this field",
                        //       colorText: Colors.white,
                        //       backgroundColor: Colors.red,
                        //       icon: const Icon(Icons.add_alert)
                        //   );
                        // }

                      }
                  )

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}