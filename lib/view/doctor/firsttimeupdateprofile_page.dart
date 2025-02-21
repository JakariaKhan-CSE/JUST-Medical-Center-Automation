

import '../../exports.dart';
import '../../model/req/doctor/doctorProfileUpdateModel.dart';
import '../../responsive.dart';
import '../../widget/common/customButton.dart';

class FirstTimeUpdateProfilePage extends StatefulWidget {
  final String role;
  FirstTimeUpdateProfilePage({super.key, required this.role});

  @override
  State<FirstTimeUpdateProfilePage> createState() =>
      _FirstTimeUpdateProfilePageState();
}

class _FirstTimeUpdateProfilePageState
    extends State<FirstTimeUpdateProfilePage> {
  final _key = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();

  final TextEditingController specialist = TextEditingController();

  final TextEditingController description = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    specialist.dispose();
    description.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageUploader =
        Provider.of<ImageUploaderDoctor>(context, listen: true);
    final loginNotifier =
    Provider.of<LoginNotifier>(context, listen: true);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Update Doctor Profile',
                style: Responsive.isDesktop(context)
                    ? Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w800, letterSpacing: 2.3)
                    : Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w700, letterSpacing: 2.0),
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
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  if (imageUploader.profileImageUrl == null) {
                    // Pick and upload image if none exists
                    await imageUploader.pickProfileImageAndUpload();
                  } else {
                    // Delete image if it already exists
                    await imageUploader.deleteProfileImageFromCloudinary(
                        imageUploader.profilePublicID!);
                  }
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.lightBlue,
                  backgroundImage: imageUploader.profileImageUrl != null
                      ? NetworkImage(imageUploader.profileImageUrl ??
                          'https://cdn-icons-png.flaticon.com/512/3135/3135715.png') // Show uploaded image
                      : null,
                  child: imageUploader.profileImageUrl == null
                      ? const Icon(Icons.photo_filter_rounded)
                      : null,
                ),
              ),
              Padding(
                padding: Responsive.isDesktop(context)
                    ? EdgeInsets.symmetric(horizontal: 150)
                    : EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Name: ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: SizedBox(
                          width: Responsive.isDesktop(context)
                              ? size.width / 2.5
                              : size.width / 1.1,
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter your name";
                              }
                              return null;
                            },
                            controller: name,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Specialist: ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: SizedBox(
                          width: Responsive.isDesktop(context)
                              ? size.width / 2.5
                              : size.width / 1.1,
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter your specialist";
                              }
                              return null;
                            },
                            controller: specialist,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Description: ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: SizedBox(
                          width: Responsive.isDesktop(context)
                              ? size.width / 2.5
                              : size.width / 1.1,
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter your description";
                              }
                              return null;
                            },
                            controller: description,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Signature: ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (imageUploader.SignatureImageUrl == null) {
                            // Pick and upload image if none exists
                            await imageUploader.pickSignatureImageAndUpload();
                          } else {
                            // Delete image if it already exists
                            await imageUploader
                                .deleteSignatureImageFromCloudinary(
                                    imageUploader.signaturePublicID!);
                          }
                        },
                        child: Container(
                          height: 60,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: imageUploader.SignatureImageUrl == null
                              ? const Icon(Icons.camera_alt_outlined)
                              : Image.network(imageUploader.SignatureImageUrl!),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Consumer<ImageUploaderDoctor>(
                        builder: (context, imageUploaderDoctor, child) {
                          return Align(
                            alignment: Alignment.center,
                            child: CustomButton(
                              pressed: () {
                                if (imageUploader.profileImageUrl == null) {
                                  Get.snackbar("Profile Image Missing",
                                      "Please upload an Profile image to proceed",
                                      colorText: Colors.white,
                                      backgroundColor: Colors.orange,
                                      icon: const Icon(Icons.add_alert));
                                } else if (imageUploader.SignatureImageUrl ==
                                    null) {
                                  Get.snackbar("Signature Image Missing",
                                      "Please upload an Signature image to proceed",
                                      colorText: Colors.white,
                                      backgroundColor: Colors.orange,
                                      icon: const Icon(Icons.add_alert));
                                } else if (_key.currentState!.validate()) {
                                  // call update doctor profile functionalities
                                  DoctorProfileUpdateModel
                                      doctorProfileUpdateModel =
                                      DoctorProfileUpdateModel(
                                          name: name.text,

                                          specialist: specialist.text,
                                          isUpdatedProfile: true,
                                          role: widget.role,
                                          description: description.text ?? '',
                                          profile:
                                              imageUploader.profileImageUrl,
                                          signature:
                                              imageUploader.SignatureImageUrl,
                                          profilePublicID:
                                              imageUploader.profilePublicID,
                                          signaturePublicID:
                                              imageUploader.signaturePublicID);

                                  loginNotifier.updateDoctorProfile(doctorProfileUpdateModel);

                                }
                              },
                              btnName: "Update Profile",
                              backgroundColor:
                                  Colors.lightGreen.withValues(alpha: 0.7),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
