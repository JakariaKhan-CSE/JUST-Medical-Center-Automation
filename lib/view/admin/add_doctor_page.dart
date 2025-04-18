import 'package:just_medical_center_automation/controller/adminController/adminDataController.dart';
import 'package:just_medical_center_automation/model/req/admin/add_doctor_res.dart';

import 'export.dart';
class AddDoctorPage extends StatefulWidget {


  AddDoctorPage({super.key});

  @override
  State<AddDoctorPage> createState() => _AddDoctorPageState();
}

class _AddDoctorPageState extends State<AddDoctorPage> {
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
          padding: Responsive.isDesktop(context) ? const EdgeInsets.only(top: 80): EdgeInsets.all(14),
          child: Row(
            children: [
              if(Responsive.isDesktop(context))
              Spacer(),
              Column(
                children: [
                  Text(
                    'Added New Doctor',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  CustomTextField(
                    label: 'Doctor Name',
                    fieldController: nameController,
                    textInputType: TextInputType.name,
                    validator: (val) {
                      if(val!.isEmpty)
                        {
                          return "Enter Doctor Name";
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
                        return "Enter Doctor Email";
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
                      obscureText: controller.isSecure,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.setSecure();
                            },
                            icon: controller.isSecure
                                ? Icon(Icons.visibility_off)
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
                      obscureText: controller.isConfirmSecure,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Confirm Password is required";
                        }
                        else if(passwordController.text != conformPasswordController.text)
                          {
                            return "Password are not same";
                          }
                        return null;
                      },
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.setConfirmSecure();
                            },
                            icon: controller.isConfirmSecure
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
                     print('form is valid');
                     print(nameController.text);
                     AddDoctorReq model = AddDoctorReq(
                       name: nameController.text,
                       email: emailController.text,
                       password: passwordController.text,
                       role: 'doctor'
                     );
                     adminDatacontroller.addDoctorRole(model, context);
                   }
                 }, child: Text('Submit')),
                  if(Responsive.isDesktop(context))
                  CustomButton(
                    btnName: 'Submit',
                    pressed: () {
                      if (_formkey.currentState!.validate()) {
                        AddDoctorReq model = AddDoctorReq(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            role: 'doctor'
                        );
                        adminDatacontroller.addDoctorRole(model, context);
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
