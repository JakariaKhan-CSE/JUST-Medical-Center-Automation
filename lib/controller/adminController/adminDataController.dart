import 'package:just_medical_center_automation/controller/adminController/adminController.dart';
import 'package:just_medical_center_automation/model/res/admin/every_role_response.dart';
import 'package:just_medical_center_automation/services/helper/adminHelper.dart';
import 'package:just_medical_center_automation/view/patient/export.dart';

class AdminDataNotifier extends ChangeNotifier{
  // search patient
  EveryRoleRes? _anyUser;
  EveryRoleRes? get anyUser => _anyUser;  // get patient data here

  Future<void> searchAnyRole(int ID, BuildContext context) async {
    final _adminController = Provider.of<AdminController>(context,listen: false);

    AdminHelper.searchEveryRole(ID).then((response){
      if(!response[0])
      {
        Get.snackbar("No User Found", "Please search by valid user ID",
            colorText: Colors.white,
            backgroundColor: Colors.deepOrange,
            icon: const Icon(Icons.add_alert)
        );
      }
      else if(response[0])
      {
        _anyUser = response[1];
        //go to search user show screen
        _adminController.SetIndex(7);
      }
    });
  }
}