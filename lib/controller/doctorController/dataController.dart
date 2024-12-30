import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DoctorDataController extends ChangeNotifier {
  List<String> dropdownItems = [];
  String? selectedItem;

  String? getSelectedItem() {
    return selectedItem;
  }

  void setSelectedItem(String val) {
    selectedItem = val;
    notifyListeners();
  }

  Future<void> fetchDropdownItems() async {
    try {
      final items = await FirebaseFirestore.instance
          .collection('services')
          .get()
          .then((querySnapshot) =>
          querySnapshot.docs.map((doc) => doc['testName'].toString()).toList());

      dropdownItems = items;
      notifyListeners();
    } catch (e) {
      print('Error fetching dropdown items: $e');
    }
  }
}
