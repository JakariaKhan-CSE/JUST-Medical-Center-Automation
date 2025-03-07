
import 'package:just_medical_center_automation/view/doctor/widget/doctor/component/doctorSeePatientLineInfo.dart';

import '../../exports.dart';
import '../../model/res/doctor/AllPatient.dart';
import '../../responsive.dart';
import '../../widget/common/customButton.dart';

class PatientDetailsPage extends StatefulWidget {

  const PatientDetailsPage({super.key});

  @override
  State<PatientDetailsPage> createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<DoctorController>(context,listen: false);
    AllPatient? patient = _controller.patient;
    return Scaffold(
      appBar: AppBar(title: Text('Patient Details'),centerTitle: true,backgroundColor: Colors.transparent,),
      backgroundColor: Colors.cyanAccent.withOpacity(0.6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Responsive.isDesktop(context) ? Row(
              children: [
             Expanded(
               flex: 2,
               child: Column(
                 children: [
                   doctorSeePatientLineInfo(name: "Patient Name",value: '${patient?.name}',),
                   SizedBox(height: 10,),
                   doctorSeePatientLineInfo(name: "Patient ID",value: '${patient?.iD}',),
                   SizedBox(height: 10,),
                   doctorSeePatientLineInfo(name: "Patient age",value: '${patient?.age}',),
                   SizedBox(height: 10,),
                 // later use this when update database for users(department)
                 //  doctorSeePatientLineInfo(name: "Patient Department",value: '${patient?.department}',),

                 ],
               ),
             ),
                Spacer(),
                Container(
                    height: 150,
                    width: 150,
                    child: patient?.profile != null ? Image.network(patient!.profile!,fit: BoxFit.cover,) :Image.network('https://media.istockphoto.com/id/1130884625/vector/user-member-vector-icon-for-ui-user-interface-or-profile-face-avatar-app-in-circle-design.jpg?s=612x612&w=0&k=20&c=1ky-gNHiS2iyLsUPQkxAtPBWH1BZt0PKBB1WBtxQJRE=',fit: BoxFit.cover,))
                // patient picture here
              ],
            ):
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // use patient picture here
                Container(
                  padding: EdgeInsets.all(5),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3)
                    ),
                    child: patient?.profile != null ? Image.network(patient!.profile!,fit: BoxFit.cover,) : Image.network('https://media.istockphoto.com/id/1130884625/vector/user-member-vector-icon-for-ui-user-interface-or-profile-face-avatar-app-in-circle-design.jpg?s=612x612&w=0&k=20&c=1ky-gNHiS2iyLsUPQkxAtPBWH1BZt0PKBB1WBtxQJRE=',fit: BoxFit.cover,)),
                SizedBox(height: 20,),
      Card(
        elevation: 5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
                      children: [
                        doctorSeePatientLineInfo(name: "Patient Name",value: '${patient?.name}',),
                        SizedBox(height: 10,),
                        doctorSeePatientLineInfo(name: "Patient ID",value: '${patient?.iD}',),
                        SizedBox(height: 10,),
                        doctorSeePatientLineInfo(name: "Patient age",value: '${patient?.age}',),
                        SizedBox(height: 10,),
                      //later use this when update database users model(department)
                      //  doctorSeePatientLineInfo(name: "Patient Department",value: '${patient?.department}',),

                      ],
                    ),
        ),
      ),


                // patient picture here
              ],
            ),
            Responsive.isDesktop(context) ? SizedBox(height: 100,):SizedBox(height: 30,),
            CustomButton(pressed: (){
              // when doctor click make prescription for new patient it requires to remove previous prescription field from controller
              _controller.removeAllTextField();
              // show make prescription screen
              _controller.SetIndex(5);

            }, btnName: 'Make Prescription',backgroundColor: Colors.lightGreenAccent,),
            Responsive.isDesktop(context) ? SizedBox(height: 30,):SizedBox(height: 15,),
            //if(Responsive.isDesktop(context))
            // CustomButton(pressed: (){
            //   // patient previous prescription name like(ID-prescription 1,2,..)
            //   // set controller value
            //   _controller.SetIndex(7);
            // }, btnName: 'Previous Prescription',backgroundColor: Colors.deepOrangeAccent,),
            // Responsive.isDesktop(context) ? SizedBox(height: 30,):SizedBox(height: 15,),
            // add this feature future
            // CustomButton(pressed: (){
            //   // go to patient previous test report
            //   // set controller value
            //   _controller.SetIndex(8);
            // }, btnName: 'Previous Test Report',backgroundColor: Colors.cyanAccent,)
          ],
        ),
      ),
    );
  }
}


