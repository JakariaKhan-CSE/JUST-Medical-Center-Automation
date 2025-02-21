import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AmbulanceServicePage extends StatelessWidget {


 AmbulanceServicePage({super.key});
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Spacer(),
                Icon(Icons.call,size: 28, color: Colors.green,),
                SizedBox(width: 3,),
                Text('01733-347284',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                Spacer(),
              ],
            ),
            SizedBox(height: 10,),
            ElevatedButton(style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              minimumSize: Size(120, 40)
            ),onPressed: ()async{
             _makePhoneCall('01733347284');

            }, child: Text('Call ',style: TextStyle(fontSize: 18),))
          ],
        ),
      ),
    );
  }
}
