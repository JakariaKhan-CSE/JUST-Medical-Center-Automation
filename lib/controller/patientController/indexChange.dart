import 'package:flutter/cupertino.dart';

class IndexChangeProvider extends ChangeNotifier{
  int currentPageIndex = 0;

  void ChangeIndexValue(index){
    currentPageIndex = index;
    notifyListeners();
  }

  // for password secure logic
  bool _oldPasswordSecure = true;
  bool _newPasswordSecure = true;
  bool _confirmPasswordSecure = true;

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

}