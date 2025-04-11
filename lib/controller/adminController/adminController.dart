import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:just_medical_center_automation/services/helper/adminHelper.dart';

import '../../exports.dart';

class AdminController extends ChangeNotifier{
  int current_index = 0;
  bool isSecure = true;
  bool isConfirmSecure = true;
  bool isPharSecure = true;
  bool isPharConfirmSecure = true;

  void setSecure()
  {
    isSecure = !isSecure;
    notifyListeners();
  }
  void setConfirmSecure()
  {
    isConfirmSecure = !isConfirmSecure;
    notifyListeners();
  }

  void setPharSecure()
  {
    isPharSecure = !isPharSecure;
    notifyListeners();
  }
  void setPharConfirmSecure()
  {
    isPharConfirmSecure = !isPharConfirmSecure;
    notifyListeners();
  }

  void SetIndex(index)
  {
    current_index = index;
    notifyListeners();
  }

  deleteDoctor(String doctorID, BuildContext context){
    AdminHelper.deleteDoctor(doctorID).then((response){
      // success hole 0 index a true and failed hole false
      if(response){

        Get.snackbar("Doctor Successfully Deleted", "Please Check your Doctor List",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            icon: const Icon(Icons.bookmark_add)
        );
        Provider.of<AdminController>(context, listen: true).SetIndex(0);
      }else if(!response){
        Get.snackbar("Failed to delete Doctor", "Please try again",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.bookmark_add)
        );
      }
    });

notifyListeners();

  }

}