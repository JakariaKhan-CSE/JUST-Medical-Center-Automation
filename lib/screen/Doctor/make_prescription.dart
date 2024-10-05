import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:just_medical_center_automation/widget/common/customButton.dart';
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
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                    itemCount: doctorNotifier.textEditingControllerList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final textController = doctorNotifier.textEditingControllerList[index];
                      final daysController = doctorNotifier.daysTextEditingControllerList[index];

                      // for checkbox
                      final morning = doctorNotifier.morningList[index];
                      final afternoon = doctorNotifier.afternoonList[index];
                      final night = doctorNotifier.nightList[index];
                      final beforeMeal = doctorNotifier.beforeList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextField(
                                  fieldController: textController,
                                  label: "Medicine Name",
                                  textInputType: TextInputType.text),

                              Container(
                                width: MediaQuery.of(context).size.width*0.08,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: TextFormField(
                                  controller: daysController,

                                  decoration: InputDecoration(
                                    label: Text('days'),
                                    hintText: "Enter days",
                                    border:  OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                                  ),
                                ),
                              ),

                              index != 0? IconButton(onPressed: (){
                          doctorNotifier.removeTextField(index);
                              }, icon: Icon(Icons.delete)):const SizedBox()
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.2,
                                    child: Checkbox(
                                        value: morning,
                                        onChanged: (val){
                                          setState(() {
                                            doctorNotifier.morningList[index] = val!;
                                          });
                                        }),
                                  ),
                                  Transform.scale(
                                    scale: 1.2,
                                    child: Checkbox(
                                        value: afternoon,
                                        onChanged: (val){
                                          setState(() {
                                            doctorNotifier.afternoonList[index] = val!;
                                          });
                                        }),
                                  ),
                                  Transform.scale(
                                    scale: 1.2,
                                    child: Checkbox(
                                        value: night,
                                        onChanged: (val){
                                          setState(() {
                                            doctorNotifier.nightList[index] = val!;
                                          });
                                        }),
                                  )
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Text('Before meal: '),
                                  Transform.scale(
                                    scale: 1.2,
                                    child: Checkbox(
                                        value: beforeMeal,
                                        onChanged: (val){
                                          setState(() {
                                            doctorNotifier.beforeList[index] = val!;
                                          });
                                        }),
                                  ),


                                ],
                              ),
                              Spacer(),
                              Spacer(),
                            ],
                          )
                        ],
                      ),
                    );
                  },),
                ),
                CustomButton(pressed: (){
                  // generate prescription
                }, btnName: "Generate Prescription",backgroundColor: Colors.lime,),
                SizedBox(height: 10,),
              ],
            );
          },),
floatingActionButton: FloatingActionButton.extended(onPressed: (){
_controller.generateTextEditingController();
_controller.generateCheckBoxRule();
_controller.generateCheckBoxMeal();
}, label: Text('Add more'),
icon: Icon(Icons.add),),
    );
  }
}
