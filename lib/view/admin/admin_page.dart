import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/view/admin/sidebar.dart';
import 'package:just_medical_center_automation/view/admin/widget/admin/adminRightSideFeaturePage.dart';
import '../../controller/adminController/adminDataController.dart';
import '../../exports.dart';
import '../../responsive.dart';


class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final adminDataController =
    Provider.of<AdminDataNotifier>(context, listen: true);

    adminDataController.getAllDoctor();
  }
  @override
  Widget build(BuildContext context) {
    final _pageController = Provider.of<AdminController>(context, listen: true);
    return Scaffold(
      appBar: Responsive.isDesktop(context) ? null: AppBar(
          leading: Builder(builder: (context) => IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: const Icon(Icons.menu)),),
        title: Text('Admin'),centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            _pageController.SetIndex(0);
          }, icon: Icon(Icons.home, color: Colors.black,size: 25,))
        ],
      ),
      drawer: SideBar(),
      body: Row(
        children: [
          if(Responsive.isDesktop(context))
          Expanded(
              flex: 2,
              child: SideBar()
          ),
          Expanded(
              flex: 7,
              child: Container(color: Colors.green.withOpacity(0.3),
                child: Adminrightsidefeaturepage(),
              )
          )
        ],
      ),
    );
  }
}






