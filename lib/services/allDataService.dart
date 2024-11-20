import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../data/servicesData.dart';

class AllDataServices {
  // Use a singleton pattern or make the list static to ensure the data is loaded once and accessible throughout the app.
  static final List<JUSTMedicalServiceData> servicesData = [];

  Future<void> getDataFromFirebase() async {
    if (servicesData.isNotEmpty) return; // Avoid refetching if data is already loaded.
    try {
      CollectionReference collectionReference = FirebaseFirestore.instance.collection('services');
      QuerySnapshot allDatasnapShot = await collectionReference.get();
      for (var doc in allDatasnapShot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final testName = data['testName'];
        final rate = data['rate'];
        JUSTMedicalServiceData model = JUSTMedicalServiceData(
          testName: testName,
          rate: rate,
        );
        servicesData.add(model);
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }
}
