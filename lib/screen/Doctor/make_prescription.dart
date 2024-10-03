import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:just_medical_center_automation/widget/common/customTextField.dart';
import 'package:provider/provider.dart';

class MakePrescription extends StatefulWidget {
  const MakePrescription({super.key});

  @override
  State<MakePrescription> createState() => _MakePrescriptionState();
}

class _MakePrescriptionState extends State<MakePrescription> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<DoctorController>(context,listen: true);
    return Scaffold(
backgroundColor: Colors.tealAccent.withOpacity(0.3),
      body: Consumer<DoctorController>(
          builder: (context, doctorNotifier, child) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              itemCount: doctorNotifier.textEditingControllerList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final textController = doctorNotifier.textEditingControllerList[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(
                      fieldController: textController,
                      label: "Medicine Name",
                      textInputType: TextInputType.text),
                  index != 0? IconButton(onPressed: (){
doctorNotifier.removeTextField(index);
                  }, icon: Icon(Icons.delete)):const SizedBox()
                ],
              );
            },);
          },),
floatingActionButton: FloatingActionButton.extended(onPressed: (){
_controller.generateTextEditingController();
}, label: Text('Add more'),
icon: Icon(Icons.add),),
    );
  }
}
