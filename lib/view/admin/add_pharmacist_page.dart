import 'package:just_medical_center_automation/model/req/admin/add_pharmacist_req.dart';

import '../../controller/adminController/adminDataController.dart';
import 'export.dart';
class AddPharmacistPage extends StatefulWidget {


  AddPharmacistPage({super.key});

  @override
  State<AddPharmacistPage> createState() => _AddPharmacistPageState();
}

class _AddPharmacistPageState extends State<AddPharmacistPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController conformPasswordController =
  TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AdminController>(context, listen: true);
    final adminDatacontroller = Provider.of<AdminDataNotifier>(context, listen: false);

    return Scaffold(
      //backgroundColor: Colors.deepPurple.withOpacity(0.1),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: Responsive.isDesktop(context) ? const EdgeInsets.only(top: 80):EdgeInsets.all(10),
              child: Row(
                children: [
                  if(Responsive.isDesktop(context))
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        'Added New Pharmacist',
                        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      CustomTextField(
                        label: 'Pharmacist Name',
                        fieldController: nameController,
                        textInputType: TextInputType.name,
                        validator: (val) {
                          if(val!.isEmpty)
                          {
                            return "Enter Pharmacist Name";
                          }
                          else
                            return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        fieldController: emailController,
                        label: 'Email',
                        textInputType: TextInputType.emailAddress,
                        validator: (val) {
                          if(val!.isEmpty)
                          {
                            return "Enter Pharmacist Email";
                          }
                          else
                            return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: Responsive.isDesktop(context)  ? MediaQuery.of(context).size.width * 0.3:MediaQuery.of(context).size.width -30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: controller.isPharSecure,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is required";
                            }
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.setPharSecure();
                                },
                                icon: controller.isPharSecure
                                    ? Icon(Icons.visibility_off_outlined)
                                    : Icon(Icons.remove_red_eye),
                              ),
                              label: Text(
                                'Password',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              hintText: 'Enter Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: Responsive.isDesktop(context)  ? MediaQuery.of(context).size.width * 0.3:MediaQuery.of(context).size.width -30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: conformPasswordController,
                          obscureText: controller.isPharConfirmSecure,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Confirm Password is required";
                            }
                            else if(passwordController.text != conformPasswordController.text)
                            {
                              return "Password are not same";
                            }
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.setPharConfirmSecure();
                                },
                                icon: controller.isPharConfirmSecure
                                    ? Icon(Icons.visibility_off_outlined)
                                    : Icon(Icons.remove_red_eye),
                              ),
                              label: Text(
                                'Confirm Password',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              hintText: 'Enter Confirm Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      if(Responsive.isMobile(context))
                        ElevatedButton(style: ElevatedButton.styleFrom(

                            backgroundColor: Colors.deepOrange, foregroundColor: Colors.white
                        ),onPressed: (){
                          if (_formkey.currentState!.validate()) {

                            AddPharmaReq model = AddPharmaReq(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                role: 'pharmacist'
                            );
                            adminDatacontroller.addPharmaRole(model, context);
                          }
                        }, child: Text('Submit')),
                      if(Responsive.isDesktop(context))
                      CustomButton(
                        btnName: 'Submit',
                        pressed: () {
                          if (_formkey.currentState!.validate()) {
                            AddPharmaReq model = AddPharmaReq(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                role: 'pharmacist'
                            );
                            adminDatacontroller.addPharmaRole(model, context);
                          }
                        },
                      ),
                    ],
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
        ));
  }
}
