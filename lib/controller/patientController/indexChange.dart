import 'package:flutter/cupertino.dart';

class IndexChange extends ChangeNotifier{
  int currentPageIndex = 0;

  void ChangeIndexValue(index){
    currentPageIndex = index;
    notifyListeners();
  }


}