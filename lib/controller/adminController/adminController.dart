import 'package:flutter/cupertino.dart';

class AdminController extends ChangeNotifier{
  int current_index = 0;
  bool isSecure = true;
  bool isConfirmSecure = true;

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

  void SetIndex(index)
  {
    current_index = index;
    notifyListeners();
  }

}