import 'package:flutter/material.dart';

class UpdatePatientProfile extends StatefulWidget {
  const UpdatePatientProfile({super.key});

  @override
  State<UpdatePatientProfile> createState() => _UpdatePatientProfileState();
}

class _UpdatePatientProfileState extends State<UpdatePatientProfile> {
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController ID = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  void initState() {
    // phone.text = widget.profile.phone!;
    // name.text = widget.profile.location;
    // ID.text = widget.profile.skills[0];
    // email.text = widget.profile.skills[1];
    // gender.text = widget.profile.skills[2];
    // age.text = widget.profile.skills[3];
    super.initState();
  }
  @override
  void dispose() {
    phone.dispose();
    name.dispose();
    ID.dispose();
    email.dispose();
    gender.dispose();
    age.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(child: Text("update profile"),),
    );
  }
}
