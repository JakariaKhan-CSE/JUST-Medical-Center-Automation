import 'export.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _pageController = Provider.of<AdminController>(context,listen: true);
    final loginNotifier = Provider.of<LoginNotifier>(context);
    return Drawer(
      child: Container(
        color: Colors.white,
        //color: Colors.lightBlue.withOpacity(0.3),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const adminPicture(),
            const Divider(),
            const SizedBox(height: 30,),
            featureItem(featureName: "DashBoard",onTap: (){
      _pageController.SetIndex(0);
      Scaffold.of(context).closeDrawer();
            },),
            const SizedBox(height: 15,),
            featureItem(featureName: "Add Doctor",onTap: (){
              _pageController.SetIndex(1);
              Scaffold.of(context).closeDrawer();
            },),
            const SizedBox(height: 15,),
            featureItem(featureName: "Add Pharmacist",onTap: (){
              _pageController.SetIndex(2);
              Scaffold.of(context).closeDrawer();
            },),
            // const SizedBox(height: 15,),
            // featureItem(featureName: "See all Medicine",onTap: (){
            //   _pageController.SetIndex(3);
            //   Scaffold.of(context).closeDrawer();
            // },),
            const SizedBox(height: 15,),
            // featureItem(featureName: "See Monthly Record",onTap: (){
            //   _pageController.SetIndex(6);
            //   Scaffold.of(context).closeDrawer();
            // },),
            // const SizedBox(height: 15,),
            featureItem(featureName: "Log Out",onTap: (){
              Get.offAll(LoginPage());
              loginNotifier.logout();
              _pageController.SetIndex(9);
              Scaffold.of(context).closeDrawer();
            },),

            const SizedBox(height: 30,),
            const Divider(),
          ],
        ),
      ),
    );
  }
}