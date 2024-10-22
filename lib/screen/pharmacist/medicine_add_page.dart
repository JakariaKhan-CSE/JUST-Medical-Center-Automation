import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:just_medical_center_automation/widget/common/customButton.dart';
import 'package:just_medical_center_automation/widget/common/customTextField.dart';

class MedicineAddPage extends StatefulWidget {
  const MedicineAddPage({super.key});

  @override
  State<MedicineAddPage> createState() => _MedicineAddPageState();
}

class _MedicineAddPageState extends State<MedicineAddPage> {
  final TextEditingController _medicineController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return Scaffold(
      backgroundColor: CupertinoColors.systemIndigo.withOpacity(0.4),
      body: Stack(
        children: [
          Opacity(opacity: 0.3,
          child: Image.asset('images/add_medicine_background.png',height: size.height,width: size.width,
            fit: BoxFit.cover,),),
          Center(child: Form(
key: _key,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Column(
                children: [
                  Text('Add Medicine',style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w700),),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Divider(color: Colors.black,),
                  ),
                  SizedBox(height: 90,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      CustomTextField(
                          fieldController: _medicineController,
                          label: "Type Medicine Name",
                          textInputType: TextInputType.text),
                      Spacer(),
                      CustomTextField(
                          fieldController: _quantityController,
                          label: "Quantity",
                          textInputType: TextInputType.number),
                      Spacer()
                    ],
                  ),
                  SizedBox(height: 40,),
                  CustomButton(pressed: (){
                    if(_key.currentState!.validate())
                      {
                        // add medicine data to the database and clear textController text
                        // and also show scaffold message

                        _medicineController.clear();
                        _quantityController.clear();
                      }
                  }, btnName: "Add Medicine",backgroundColor: Colors.cyanAccent,)
                ],
              ),
            ),
          ),)
        ],
      ),
    );
  }
}
