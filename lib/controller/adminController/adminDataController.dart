import 'package:just_medical_center_automation/controller/adminController/adminController.dart';
import 'package:just_medical_center_automation/model/req/admin/add_doctor_res.dart';
import 'package:just_medical_center_automation/model/req/admin/add_pharmacist_req.dart';
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

  addDoctorRole(AddDoctorReq model, BuildContext context)
  {
    final controller = Provider.of<AdminController>(context, listen: false);

    AdminHelper.AddDoctorHelper(model).then((response){

      if(!response)
      {
        Get.snackbar("Failed to Add Doctor", "Please try again",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.add_alert)
        );
      }
      // user er profile information update na thakle personal details page a niye jabe
      else if(response)
      {
        Get.snackbar("Successful", "Successfully Added Doctor",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            icon: const Icon(Icons.add_alert)
        );
        // go to dashboard
        controller.SetIndex(0);
      }

    }
    );
  }

  addPharmaRole(AddPharmaReq model, BuildContext context)
  {
    final controller = Provider.of<AdminController>(context, listen: false);

    AdminHelper.AddPharmacistHelper(model).then((response){

      if(!response)
      {
        Get.snackbar("Failed to Add Pharmacist", "Please try again",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.add_alert)
        );
      }
      // user er profile information update na thakle personal details page a niye jabe
      else if(response)
      {
        Get.snackbar("Successful", "Successfully Added Pharmacist",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            icon: const Icon(Icons.add_alert)
        );
        // go to dashboard
        controller.SetIndex(0);
      }

    }
    );
  }
  
  // for all doctor
  Future<List<EveryRoleRes>>? allDoctor;
  getAllDoctor()async{
    allDoctor =  AdminHelper.getAllDoctor();
  }

}