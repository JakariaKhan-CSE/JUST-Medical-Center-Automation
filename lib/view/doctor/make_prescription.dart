

import '../../exports.dart';
import '../../responsive.dart';
import '../../widget/common/customButton.dart';
import '../../widget/common/customTextField.dart';

class MakePrescription extends StatefulWidget {
  const MakePrescription({super.key});

  @override
  State<MakePrescription> createState() => _MakePrescriptionState();
}

class _MakePrescriptionState extends State<MakePrescription> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<DoctorController>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.tealAccent.withOpacity(0.3),
      body: Consumer<DoctorController>(
        builder: (context, doctorNotifier, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  itemCount: doctorNotifier.textEditingControllerList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final textController =
                        doctorNotifier.textEditingControllerList[index];
                    final daysController =
                        doctorNotifier.daysTextEditingControllerList[index];

                    // for checkbox
                    final morning = doctorNotifier.morningList[index];
                    final afternoon = doctorNotifier.afternoonList[index];
                    final night = doctorNotifier.nightList[index];
                    final beforeMeal = doctorNotifier.beforeList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Card(
                        elevation: 3,
                        child: Padding(

                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 5),
                          child:  Column(
                            children: [
                              buildTextField(textController, context,
                                  daysController, index, doctorNotifier),
                              SizedBox(
                                height: 5,
                              ),
                              buildCheckBox(morning, doctorNotifier, index,
                                  afternoon, night, beforeMeal)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              CustomButton(
                pressed: () {
                  // generate prescription
                  doctorNotifier.generatePrescription(context);
                  print('click prescription generate button ');
                  // this diagnostic lab test drop down(which data fetch from firebase)
                  // enable this feature for future release
                 // doctorNotifier.SetIndex(12);
                },
                btnName: "Generate Prescription",
                backgroundColor: Colors.lime,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _controller.generateTextEditingController();
          _controller.generateCheckBoxRule();
          _controller.generateCheckBoxMeal();
        },
        label: Text('Add more'),
        icon: Icon(Icons.add),
      ),
    );
  }

  Widget buildTextField(
      TextEditingController textController,
      BuildContext context,
      TextEditingController daysController,
      int index,
      DoctorController doctorNotifier) {
    return Responsive.isDesktop(context) ? Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${index+1}.',style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),),
        SizedBox(width: 3,),
        CustomTextField(
            fieldController: textController,
            label: "Medicine Name",
            textInputType: TextInputType.text),
        SizedBox(width: 10,),
        Container(
          width: MediaQuery.of(context).size.width * 0.08,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: daysController,
            decoration: InputDecoration(
                label: Text('days'),
                hintText: "Enter days",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Spacer(),
        index != 0
            ? IconButton(
                onPressed: () {
                  doctorNotifier.removeTextField(index);
                },
                icon: Icon(Icons.delete,color: Colors.red,))
            : const SizedBox(),
        SizedBox(width: 10,)
      ],
    ):
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('${index+1}.',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),),
            SizedBox(width: 1,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextFormField(
                    controller:  textController,
                    validator: (val){
                      if(val!.isEmpty)
                        {
                          return "Enter medicine name";
                        }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text("Medicine Name"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),

                   ),
              ),
            ),
SizedBox(width: 5,),
            index != 0
                ? IconButton(
                onPressed: () {
                  doctorNotifier.removeTextField(index);
                },
                icon: Icon(Icons.delete,color: Colors.deepOrange,))
                : const SizedBox()
          ],
        ),
        SizedBox(height: 5,),

        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              validator: (val){
                if(val!.isEmpty)
                {
                  return "Enter medicine days";
                }
                return null;
              },
              controller: daysController,
              decoration: InputDecoration(
                  label: Text('days'),
                  hintText: "Enter days",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
        ),

      ],
    );
  }

  Row buildCheckBox(bool morning, DoctorController doctorNotifier, int index,
      bool afternoon, bool night, bool beforeMeal) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 15,),
        Row(
          children: [
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                  value: morning,
                  onChanged: (val) {
                    setState(() {
                      doctorNotifier.morningList[index] = val!;
                    });
                  }),
            ),
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                  value: afternoon,
                  onChanged: (val) {
                    setState(() {
                      doctorNotifier.afternoonList[index] = val!;
                    });
                  }),
            ),
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                  value: night,
                  onChanged: (val) {
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
            Responsive.isDesktop(context) ? Text('Before meal: '): Text('Before: '),
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                  value: beforeMeal,
                  onChanged: (val) {
                    setState(() {
                      doctorNotifier.beforeList[index] = val!;
                    });
                  }),
            ),
          ],
        ),
        if(Responsive.isDesktop(context))
        Spacer(),
        Spacer(),
      ],
    );
  }
}
