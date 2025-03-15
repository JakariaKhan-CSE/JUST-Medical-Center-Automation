import 'package:just_medical_center_automation/controller/adminController/adminDataController.dart';
import 'package:just_medical_center_automation/model/res/admin/every_role_response.dart';
import 'package:just_medical_center_automation/model/res/admin/pharmacist_response.dart';
import 'package:just_medical_center_automation/view/admin/widget/admin/component/allPharmacistList.dart';

import 'export.dart';

class DashboardPage extends StatefulWidget {

  DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final TextEditingController searchController = TextEditingController();
//  late AdminDataNotifier adminDataController;
  final width = Get.width;

  final height = Get.height;
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     // adminDataController.fetchTotalCounts();
//   }
  @override
  Widget build(BuildContext context) {
    // if get any error using Consumer instead controller in build
   final  adminDataController = Provider.of<AdminDataNotifier>(context, listen: true);
    final controller = Provider.of<AdminController>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.deepPurple.withOpacity(0.1),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          margin: Responsive.isDesktop(context)
              ? EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20)
              : EdgeInsets.only(left: 10, right: 5, top: 0, bottom: 20),
          child: Column(
            children: [
              if (Responsive.isDesktop(context)) headerAdminDashboard(),
              if (Responsive.isDesktop(context))
                SizedBox(
                  height: 20,
                ),
              if (Responsive.isDesktop(context))
                Divider(
                  color: Colors.blue,
                  thickness: 1.5,
                ),
              Align(
                alignment: Alignment.topRight,
                child: SearchBarRoleWise(
                  controller: searchController,
                  hintText: "Search user",
                  onTap: () {
                    // admin search all user
                    if (searchController.text.isNotEmpty)
                      adminDataController.searchAnyRole(
                          int.tryParse(searchController.text) ?? 0, context);
                    //doctorNotifier.searchPatient(int.parse(patientSearch.text),context);
                    else
                      Get.snackbar(
                          "Search Field Empty", "Please search by User ID",
                          backgroundColor: Colors.pink);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TotalNumberAllElement(
                height: height,
                width: width,
                doctor: adminDataController.totalDoctors,
                pharmacist: adminDataController.totalPharmacists,
                medicine: 200000,
                patient: adminDataController.totalPatient,
              ),

              SizedBox(
                height: 20,
              ),
              listText(
                listName: 'List all Doctors',
                onTap: () {
                  controller.SetIndex(4);
                },
              ),
              Responsive.isDesktop(context)
                  ? SizedBox(
                      height: 20,
                    )
                  : SizedBox(
                      height: 10,
                    ),
              // allHorizontalList(
              //   data: DoctorData.data,
              // ),
              FutureBuilder<List<EveryRoleRes>>(
                  future: adminDataController.allDoctor,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error ${snapshot.error}'),
                      );
                    } else {
                      final allDoctorData = snapshot.data;
                      return allHorizontalList(data: allDoctorData??[]);
                    }
                  }),

              SizedBox(
                height: 40,
              ),
              listText(
                listName: 'List all Pharmacist',
                onTap: () {
                  controller.SetIndex(5);
                },
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder<List<PharmacistRes>>(
                  future: adminDataController.allPharmacist,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error ${snapshot.error}'),
                      );
                    } else {
                      final allPharmacistData = snapshot.data;
                      return allHorizontalPharmacistList(data: allPharmacistData??[]);
                    }
                  }),

            ],
          ),
        ),
      ),
    );
  }
}

class headerAdminDashboard extends StatelessWidget {
  const headerAdminDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.home,
              size: 36,
              color: Colors.black,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Dashboard',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  letterSpacing: 1.4),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        // if( Responsive.isDesktop(context))
        Padding(
          padding: const EdgeInsets.only(left: 55),
          child: Text(
            'Home',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: 1.3),
          ),
        ),
      ],
    );
  }
}
