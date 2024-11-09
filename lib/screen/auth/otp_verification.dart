import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/signUpProvider.dart';
import 'package:provider/provider.dart';

class OtpVerification extends StatefulWidget {
  final String email;
  const OtpVerification({super.key, required this.email});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
 
  final TextEditingController otp = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    var signUpNotifier = Provider.of<SignUpNotifier>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                // enabled: isEnabled,  // when send email this controller is disabled
                controller: otp,
                decoration: const InputDecoration(
                    hintText: 'Enter your OTP Code', border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: ()async{
                  // print('click');
                  final otpCode = otp.text.trim();
                  if(otpCode.isEmpty)
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter OTP Code'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    // return;
                  }else{
                signUpNotifier.verifyOTP(widget.email, otpCode);
                  }
                  
                },  
                child: const Text('Verify OTP Code'))
          ],
        ),
      ),
    );
  }
}
