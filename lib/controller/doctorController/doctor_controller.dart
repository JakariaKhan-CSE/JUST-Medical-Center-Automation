import 'package:flutter/cupertino.dart';

import '../../data/patientData.dart';

class DoctorController extends ChangeNotifier{
  int current_index = 0;
  bool _oldPasswordSecure = true;
  bool _newPasswordSecure = true;
  bool _confirmPasswordSecure = true;
  Patient? _patient;

Patient? get patient => _patient;
void setPatientData(Patient data)
{
  _patient = data;
  notifyListeners();
}

  bool get oldPasswordSecure => _oldPasswordSecure;
  void  setOldPasswordSecure(){
    _oldPasswordSecure = !_oldPasswordSecure;
    notifyListeners();
  }
  bool get newPasswordSecure => _newPasswordSecure;
  void  setNewPasswordSecure(){
    _newPasswordSecure = !_newPasswordSecure;
    notifyListeners();
  }
  bool get confirmPasswordSecure => _confirmPasswordSecure;
  void  setConfirmPasswordSecure(){
    _confirmPasswordSecure = !_confirmPasswordSecure;
    notifyListeners();
  }

  void SetIndex(index)
  {
    current_index = index;
    notifyListeners();
  }
  List<TextEditingController> textEditingControllerList = [TextEditingController()];
  List<TextEditingController> daysTextEditingControllerList = [TextEditingController()];
  //new TextEditingController with field generate
void generateTextEditingController()
{
  textEditingControllerList.add(TextEditingController());
  daysTextEditingControllerList.add(TextEditingController());
notifyListeners();
}
// remove textField
void removeTextField(int index){
  //medicine name textfield
  textEditingControllerList[index].clear();
  textEditingControllerList[index].dispose();
  textEditingControllerList.removeAt(index);
  // how many days use medicine day
  daysTextEditingControllerList[index].clear();
  daysTextEditingControllerList[index].dispose();
  daysTextEditingControllerList.removeAt(index);
  notifyListeners();

}

void removeAllTextField(){
  // for remove entire list
  textEditingControllerList.clear();
  daysTextEditingControllerList.clear();
  // for single one created for doctor easier to read
  textEditingControllerList.add(TextEditingController());
  daysTextEditingControllerList.add(TextEditingController());
  notifyListeners();
}

}