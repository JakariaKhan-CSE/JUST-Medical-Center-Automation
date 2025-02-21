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

    return Scaffold(
      //backgroundColor: Colors.deepPurple.withOpacity(0.1),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Row(
                children: [
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
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        fieldController: emailController,
                        label: 'Email',
                        textInputType: TextInputType.emailAddress,
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
                                    ? Icon(Icons.remove_red_eye_outlined)
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
                                    ? Icon(Icons.remove_red_eye_outlined)
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
                      CustomButton(
                        btnName: 'Submit',
                        pressed: () {
                          if (_formkey.currentState!.validate()) {
                            print('form is valid');
                            print(nameController.text);
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
