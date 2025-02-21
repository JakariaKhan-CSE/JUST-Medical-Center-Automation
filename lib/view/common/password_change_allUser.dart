import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:just_medical_center_automation/controller/loginProvider.dart';
import 'package:just_medical_center_automation/controller/patientController/indexChange.dart';
import 'package:provider/provider.dart';

import '../../responsive.dart';
import '../../widget/common/customButton.dart';

class PasswordChangeAllUser extends StatefulWidget {
  const PasswordChangeAllUser({super.key});

  @override
  State<PasswordChangeAllUser> createState() => _PasswordChangeAllUserState();
}

class _PasswordChangeAllUserState extends State<PasswordChangeAllUser> {
  final _key = GlobalKey<FormState>();
  final oldPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    /*
    listen: true (default behavior):

The widget that calls Provider.of will rebuild whenever LoginNotifier notifies listeners of a change.
Use this when you want the widget to update automatically if the state in LoginNotifier changes.
listen: false:

The widget will not rebuild if LoginNotifier changes.
Use this when you only need to access the object once (e.g., calling a function) and don't need to listen for updates.
     */
    final controller = Provider.of<IndexChangeProvider>(context, listen: true);
    final loginNotifier = Provider.of<LoginNotifier>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.greenAccent.withOpacity(0.4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Change Password',
            style: Responsive.isDesktop(context)
                ? Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontWeight: FontWeight.w800, letterSpacing: 2.3)
                : Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.w800, letterSpacing: 2.3),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Divider(
              height: 2,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Old Password: ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: Responsive.isDesktop(context)
                      ? size.width / 2.5
                      : size.width / 1.1,
                  child: TextFormField(
                    obscureText: controller.oldPasswordSecure,
                    controller: oldPassword,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "please type old password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.setOldPasswordSecure();
                          },
                          icon: controller.oldPasswordSecure
                              ? Icon(CupertinoIcons.eye_slash)
                              : Icon(CupertinoIcons.eye)),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'New Password: ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: Responsive.isDesktop(context)
                      ? size.width / 2.5
                      : size.width / 1.1,
                  child: TextFormField(
                    obscureText: controller.newPasswordSecure,
                    controller: newPassword,
                    validator: (val) {
                      if (val!.isEmpty || val.length < 6) {
                        return "password should be 6 digit";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.setNewPasswordSecure();
                            },
                            icon: controller.newPasswordSecure
                                ? Icon(CupertinoIcons.eye_slash)
                                : Icon(CupertinoIcons.eye)),
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Confirm Password: ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: Responsive.isDesktop(context)
                      ? size.width / 2.5
                      : size.width / 1.1,
                  child: TextFormField(
                    obscureText: controller.confirmPasswordSecure,
                    controller: confirmPassword,
                    validator: (val) {
                      if (newPassword.text != confirmPassword.text) {
                        return "password does not match";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.setConfirmPasswordSecure();
                            },
                            icon: controller.confirmPasswordSecure
                                ? Icon(CupertinoIcons.eye_slash)
                                : Icon(CupertinoIcons.eye)),
                        border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: CustomButton(
              pressed: () {

                if (_key.currentState!.validate()) {

                  loginNotifier.changePassword(context,
                      oldPassword.text.trim(), newPassword.text.trim());
                  oldPassword.clear();
                  newPassword.clear();
                  confirmPassword.clear();
                }
              },
              btnName: "Change Password",
              backgroundColor: Colors.teal.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
