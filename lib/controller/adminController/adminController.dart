import 'package:flutter/cupertino.dart';

class AdminController extends ChangeNotifier{
  int current_index = 0;
  bool isSecure = true;

  void setSecure()
  {
    isSecure = !isSecure;
    notifyListeners();
  }

  void SetIndex(index)
  {
    current_index = index;
    notifyListeners();
  }

}