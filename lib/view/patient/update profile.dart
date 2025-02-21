import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:just_medical_center_automation/controller/patientController/profileProvider.dart';
import 'package:just_medical_center_automation/model/req/auth/profileEditModel.dart';
import 'package:just_medical_center_automation/model/res/auth/profile%20response.dart';
import 'package:provider/provider.dart';
import '../../controller/patientController/imageProvider.dart';
import '../../widget/common/customButton.dart';
import '../../widget/common/customTextField.dart';

class UpdatePatientProfile extends StatefulWidget {
  const UpdatePatientProfile({super.key});

  @override
  State<UpdatePatientProfile> createState() => _UpdatePatientProfileState();
}

class _UpdatePatientProfileState extends State<UpdatePatientProfile> {
  ProfileResponse? userData;
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController ID = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController age = TextEditingController();

  // 1 = male and 2 = female
  int _gender = 1;

  @override
  void initState() {
    super.initState();
/*
WidgetsBinding.instance.addPostFrameCallback ensures the code runs after the widget tree is built.
Provider.of<ProfileNotifier>(context, listen: false) provides access to profileNotifier without listening to changes, which is safe for initState.
 */
    // very useful. see carefully
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final profileNotifier =
          Provider.of<ProfileNotifier>(context, listen: false);
      setState(() {
        userData = profileNotifier.getUserData();
        phone.text = userData?.user?.phone ?? '';
        name.text = userData?.user?.name ?? '';
        ID.text = (userData?.user?.iD ?? '').toString();
        email.text = userData?.user?.email ?? '';
        gender.text = userData?.user?.gender ?? '';
        age.text = (userData?.user?.age ?? '').toString();
        _gender = userData?.user?.gender == 'male' ? 1 : 2;
      });
    });
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
    final profileNotifier = Provider.of<ProfileNotifier>(context);
    final imageUploader = Provider.of<ImageUploader>(context);

    userData = profileNotifier
        .getUserData()!; // context issue so i cannot use this in initState

    return Scaffold(
        body: Form(
      key: profileNotifier.editProfileFormKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Personal Details',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () async {
                  if (imageUploader.imageUrl == null) {
                    // Pick and upload image if none exists
                    await imageUploader.pickImageAndUpload();
                  } else {
                    print('working delete');
print(imageUploader.publicID);
                    // Delete image if it already exists
                    if (imageUploader.publicID != null)
                      await imageUploader
                          .deleteImageFromCloudinary(imageUploader.publicID!);
                    // imageUploader.imageUrl = '';
                    // imageUploader.publicID = '';
                  }
                },
                /*
                This error occurs because NetworkImage expects a full URL (including the host) to load images over the network. Currently, your Flutter app is receiving only the relative path (/uploads/1731424764776-1000000033.jpg), so it interprets this as a local file path rather than a network URL.

To fix this, make sure to prepend the server URL to the image path when setting NetworkImage in your Flutter code.
                 */
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.lightBlue,
                  backgroundImage: imageUploader.imageUrl != null
                      ? NetworkImage(
                          imageUploader.imageUrl!) // Show uploaded image
                      : null,
                  child: imageUploader.imageUrl == null
                      ? const Icon(Icons.photo_filter_rounded)
                      : null,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                fieldController: ID,
                label: 'ID',
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                fieldController: phone,
                label: 'Phone',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                fieldController: age,
                label: 'Age',
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  // group er je kono akta select hobe 1 (male) 2(female)
                  Text(
                    'Gender: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Spacer(),
                  Radio(
                    value: 1,
                    groupValue: _gender,
                    onChanged: (gender) {
                      setState(() {
                        _gender = gender!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Male',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                    value: 2,
                    groupValue: _gender,
                    onChanged: (gender) {
                      setState(() {
                        _gender = gender!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Female',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<ImageUploader>(
                builder: (context, imageUploader, child) {
                  return Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      pressed: () {
                        if (imageUploader.imageUrl == null) {
                          Get.snackbar("Image Missing",
                              "Please upload an image to proceed",
                              colorText: Colors.white,
                              backgroundColor: Colors.orange,
                              icon: const Icon(Icons.add_alert));
                        } else if (profileNotifier.validateFormAndSave()) {
                          ProfileEditModel model = ProfileEditModel(
                              ID: int.parse(ID.text),
                              age: int.parse(age.text),
                              gender: _gender == 1 ? "male" : "female",
                              phone: phone.text,
                              profile: imageUploader.imageUrl,
                              publicID: imageUploader.publicID); // store publicId in database for delete image later

                          // call update profile function
                          profileNotifier.editProfile(model);
                        }
                      },
                      btnName: 'Update Profile',
                      backgroundColor: Colors.cyan,
                    ),
                  );
                },
              )
            ],
          ))
        ],
      ),
    ));
  }
}
