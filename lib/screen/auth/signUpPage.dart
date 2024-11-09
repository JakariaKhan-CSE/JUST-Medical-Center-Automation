import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../controller/loginProvider.dart';
import '../../controller/signUpProvider.dart';
import '../../model/req/auth/signUpModel.dart';
import '../../widget/common/customButton.dart';
import '../../widget/common/customTextField.dart';
import 'login_page.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({super.key});

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    name.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpNotifier>(
      builder: (context, signUpNotifier, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              title: Text('Sign Up'),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: signUpNotifier.registerFormKey,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text('Hello, Welcome!',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                  const Text('Fill the details to signup to your account',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextField(
                    fieldController: name,
                    label: "Full Name",
                    textInputType: TextInputType.text,
                    validator: (name) {
                      if (name!
                          .isEmpty) // email filed jodi empty hoi and @ na thake tahole invalid message return korbe
                      {
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    fieldController: email,
                    label: "Email",
                    textInputType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email!.isEmpty ||
                          !email.contains(
                              "@")) // email filed jodi empty hoi and @ na thake tahole invalid message return korbe
                      {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    fieldController: password,
                    label: "Password",
                    textInputType: TextInputType.text,
                    validator: (password) {
                      if (password!.isEmpty ||
                          password.length <
                              6) // email filed jodi empty hoi and @ na thake tahole invalid message return korbe
                      {
                        return "Please enter at least 6 digit password";
                      }
                      return null;
                    },
                    obscureText: signUpNotifier.obsecureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        signUpNotifier.obsecureText =
                            !signUpNotifier.obsecureText;
                      },
                      child: signUpNotifier.obsecureText
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      // Get.offAll use koresi jeno login page ba signup age theke back korle onno page a na jai karon login, signup page e jawar jonno already button deya ase
                      onTap: () => Get.offAll(const LoginPage()),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                      btnName: 'Sign Up',
                      backgroundColor: Colors.indigoAccent,
                      pressed: () {
                        // user registration complete korle first time false kore deya hobe jeno next time login korte gele profile update page show na kore
                        // loginNotifier.firstTime = !loginNotifier.firstTime;

                        if (signUpNotifier.validateFormAndSave()) {
                          // firstly check passowrd is strong or not
                          if(signUpNotifier.passwordValidator(password.text)){
                            SignUpModel model = SignUpModel(
                                email: email.text,
                                password: password.text,
                                username: name.text,
                                role: 'patient');

                            signUpNotifier.signUp(model);
                          }
                          else{
                            Get.snackbar(
                              "Weak Password",
                              "Please use Strong password",
                              colorText: Colors.white,
                              backgroundColor: Colors.deepOrangeAccent,
                              icon: const Icon(Icons.add_alert),
                            );
                          }
                        } else {
                          Get.snackbar(
                            "Sign up Failed",
                            "Please fill this field",
                            colorText: Colors.white,
                            backgroundColor: Colors.red,
                            icon: const Icon(Icons.add_alert),
                          );
                        }
                      })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
