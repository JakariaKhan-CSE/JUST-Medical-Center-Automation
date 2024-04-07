import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../auth/login.dart';
import '../auth/registration_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _loadDatabase()async{
    try{
      await Firebase.initializeApp(

          options: FirebaseOptions(

              apiKey: 'AIzaSyBdgtN-5WaNCWTh-TZKKp1Qy-srBRCm1PQ',
              appId: '1:57891280768:android:dea5183bb6e86d2ea09365',
              messagingSenderId: '57891280768',
              projectId: 'just-medical-center'
          )
      );
    }catch(e)
    {
      print('error is: $e');
    }


  }

  @override
  void initState() {
    _loadDatabase();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('JUST Medical Center'),
        centerTitle: true,
        elevation: 2.5,
        shadowColor: Colors.yellowAccent,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Image.asset('images/just logo.jpg',height: 90,),
                  ),
                  SizedBox(height: 5,),
                  Center(
                    child: Text("JUST Medical Center",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.4
                    ),),
                  )
                ],
              ),
            )),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx)=>HomePage()));
              },
              child: Card(

                child: ListTile(
                  title: Text('Home'),
                  trailing: Icon(Icons.arrow_forward_sharp),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Services'),
                trailing: Icon(Icons.arrow_forward_sharp),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Ambulance'),
                trailing: Icon(Icons.arrow_forward_sharp),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx)=>RegistrationPage()));
              },
              child: Card(
                child: ListTile(
                  title: Text('Registration'),
                  trailing: Icon(Icons.arrow_forward_sharp),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx)=>LoginPage()));
              },
              child: Card(
                child: ListTile(
                  title: Text('Login'),
                  trailing: Icon(Icons.arrow_forward_sharp),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('About'),
                trailing: Icon(Icons.arrow_forward_sharp),
              ),
            ),

          ],
        ),
      ),
      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child:  Image.asset('images/home picture.jpg'),
            ),
            Text('24/7 On Campus Medical Services',textAlign:TextAlign.center ,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.6
            ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('The campus has a large and well equipped medical center with four specialist doctors. There is also a 24/7 ambulance service for emergency patient'
                  ' transportations. Students can get medical service at 24/7 basis which is free of cost. '
                  'Students also get the necessary medicines which are prescribed by the doctors for their '
                  'treatments without any cost.',textAlign: TextAlign.justify, style: TextStyle(
                letterSpacing: 0.8,
                wordSpacing: 1.2,


              ),),
            )
          ],
        ),
      ),
    ));
  }
}