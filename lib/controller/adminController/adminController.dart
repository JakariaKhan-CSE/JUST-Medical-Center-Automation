import 'package:flutter/cupertino.dart';

class AdminController extends ChangeNotifier{
  int current_index = 0;

  void SetIndex(index)
  {
    current_index = index;
    notifyListeners();
  }

}