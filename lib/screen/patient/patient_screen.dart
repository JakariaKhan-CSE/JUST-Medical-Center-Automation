// this is patient home page and target design is mobile
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:just_medical_center_automation/controller/loginProvider.dart';
import 'package:just_medical_center_automation/controller/patientController/indexChange.dart';
import 'package:just_medical_center_automation/screen/auth/login_page.dart';
import 'package:just_medical_center_automation/screen/common/about_developer.dart';
import 'package:just_medical_center_automation/screen/common/ambulance_service_page.dart';
import 'package:just_medical_center_automation/screen/common/show_all_services.dart';
import 'package:just_medical_center_automation/screen/patient/PatientPrescription.dart';
import 'package:just_medical_center_automation/screen/patient/patient_home.dart';
import 'package:just_medical_center_automation/screen/patient/patient_profile.dart';
import 'package:just_medical_center_automation/screen/patient/update%20profile.dart';
import 'package:provider/provider.dart';

import '../common/prescriptiondesign.dart';
import '../homepage.dart';
class PatientScreen extends StatelessWidget {

  // drawer page added here. So that when click any item from drawer not remove bottom navigationbar. value change using provider controller
  List Screen = [const PatientHome(),PatientPrescription(),const PatientProfile(),
    const HomePage(), const PrescriptionDesign(),  AboutDeveloperPage(),
    const UpdatePatientProfile(), AmbulanceServicePage(), ShowAllServicesPage()];
  PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final indexChange = Provider.of<IndexChange>(context,listen: true);
    return Scaffold(
    appBar: AppBar(
        title: const Text('JUST Medical Center'),
        centerTitle: true,
        elevation: 2.5,
        shadowColor: Colors.yellowAccent,
      ),
      drawer: PatientDrawer(),
      body: Screen[indexChange.currentPageIndex], // change page using Screen List(which contain home and profile page)
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          // using state management. currentPageIndex = index
          indexChange.ChangeIndexValue(index);

        },
        indicatorColor: indexChange.currentPageIndex>=0 && indexChange.currentPageIndex<=2 ? Colors.amber : Colors.grey.withOpacity(0.1),
        // if user select any item from drawer 0 index mark(bottom nav bar)
        selectedIndex: indexChange.currentPageIndex>=0 && indexChange.currentPageIndex<=2 ? indexChange.currentPageIndex: 0,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.document_scanner_sharp), label: 'Prescription History'),
          NavigationDestination(icon: Icon(Icons.person_pin), label: 'Profile'),
        ],
      ),

    );
  }
}

class PatientDrawer extends StatelessWidget {
  const PatientDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final indexChange = Provider.of<IndexChange>(context,listen: true);
    final loginNotifier = Provider.of<LoginNotifier>(context);

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Image.asset('images/just logo.jpg',height: 90,),
                ),
                const SizedBox(height: 5,),
                const Center(
                  child: Text("JUST Medical Center",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.4
                  ),),
                )
              ],
            ),
          )),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              // not use navigator.push. If you use remove bottom navigationbar to get new page
              // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const HomePage()));
              //  List Screen = [const PatientHome(),PatientPrescription(),const PatientProfile(), const HomePage()];
              // here 3 index is homepage
              indexChange.ChangeIndexValue(3);
              Scaffold.of(context).closeDrawer(); // close drawer
            },
            child: const Card(

              child: ListTile(
                title: Text('DashBoard'),
                trailing: Icon(Icons.arrow_forward_sharp),
              ),
            ),
          ),
          Card(
            child: ListTile(
              onTap: (){
                // go to my all service page
                indexChange.ChangeIndexValue(8); //Screen[8]
                Scaffold.of(context).closeDrawer();
              },
              title: Text('Services'),
              trailing: Icon(Icons.arrow_forward_sharp),
            ),
          ),
          Card(
            child: ListTile(
              onTap: (){
                // go to my ambulance service page
                indexChange.ChangeIndexValue(7); //Screen[7]
                Scaffold.of(context).closeDrawer();
              },
              title: Text('Ambulance'),
              trailing: Icon(Icons.arrow_forward_sharp),
            ),
          ),
          Card(
            child: ListTile(
              onTap: (){
                // go to my change password page
                // indexChange.ChangeIndexValue(8); //Screen[8]
                // Scaffold.of(context).closeDrawer();
              },
              title: Text('Change Passord'),
              trailing: Icon(Icons.arrow_forward_sharp),
            ),
          ),
           Card(
            child: ListTile(
              onTap: (){
                // go to my developer page
                indexChange.ChangeIndexValue(5); //Screen[5]
                Scaffold.of(context).closeDrawer();
              },
              title: Text('Developer'),
              trailing: Icon(Icons.arrow_forward_sharp),
            ),
          ),

          Card(
            child: ListTile(
              onTap: (){
                // trigger logout function
                loginNotifier.logout();
                Get.offAll(LoginPage());

              },
              title: Text('Log out'),
              trailing: Icon(Icons.arrow_forward_sharp),
            ),
          ),

        ],
      ),
    );
  }
}
