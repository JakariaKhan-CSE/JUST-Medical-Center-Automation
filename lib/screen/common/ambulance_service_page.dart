import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AmbulanceServicePage extends StatelessWidget {

 AmbulanceServicePage({super.key});
 final Uri _url = Uri.parse('tel:01733347284');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('01733-347284',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            ElevatedButton(style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              minimumSize: Size(120, 40)
            ),onPressed: (){
             launchUrl(_url);

            }, child: Text('Call ',style: TextStyle(fontSize: 18),))
          ],
        ),
      ),
    );
  }
}
