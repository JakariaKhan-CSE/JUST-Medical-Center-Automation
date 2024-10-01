import 'package:flutter/cupertino.dart';

class DoctorController extends ChangeNotifier{
  int current_index = 0;
  bool _oldPasswordSecure = true;
  bool _newPasswordSecure = true;
  bool _confirmPasswordSecure = true;

  bool get oldPasswordSecure => _oldPasswordSecure;
  void  setOldPasswordSecure(){
    _oldPasswordSecure = !_oldPasswordSecure;
  }
  bool get newPasswordSecure => _newPasswordSecure;
  void  setNewPasswordSecure(){
    _newPasswordSecure = !_newPasswordSecure;
  }
  bool get confirmPasswordSecure => _confirmPasswordSecure;
  void  setConfirmPasswordSecure(){
    _confirmPasswordSecure = !_confirmPasswordSecure;
  }

  void SetIndex(index)
  {
    current_index = index;
    notifyListeners();
  }
}