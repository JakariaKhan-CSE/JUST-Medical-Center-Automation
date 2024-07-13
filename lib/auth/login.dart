import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/auth/registration_page.dart';
import 'package:just_medical_center_automation/user/new_homepage.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email;
  var password;
  //variable declare
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool secure = true;

  void _login()async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final User? user = (await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
    if(user != null)
      {
        print('Login Sucessfully');
        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>NewHomePage(user: email)));
      }
    else{
      print('unable to login');
    }
  }
  @override
  Widget build(BuildContext context) {

    //start UI here
    return SafeArea(child: Scaffold(
appBar: AppBar(title: const Text('Login'),centerTitle: true,),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

TextFormField(
  controller: _emailController,
  keyboardType: TextInputType.emailAddress,
  decoration: InputDecoration(
prefixIcon: const Icon(Icons.email_outlined),
    labelText: "Email",
    hintText: 'Enter your email',
border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(30)
)
  ),
  validator: (value){
    if(value!.isEmpty)
      {
          return "Please enter your name";
      }
    return null;

  },

),
              const SizedBox(height: 15,),
              TextFormField(
                controller: _passwordController,
                obscureText: secure,
                obscuringCharacter: '*',
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
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
                  return null;

                },

              ),
              const SizedBox(height: 40,),
              SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(onPressed: (){
email = _emailController.text;
password = _passwordController.text;

if(_formkey.currentState!.validate())
  {
    _login();
  }

_emailController.clear();
_passwordController.clear();
                },child: const Text('Log in',style: TextStyle(
                  fontWeight: FontWeight.bold,
fontSize: 20
                ),),),
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text('New user?',style: TextStyle(
                    fontSize: 15.5
                  ),),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const RegistrationPage()));
                  }, child: const Text('Create new account',style: TextStyle(
                      fontSize: 15.5
                  ),))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
