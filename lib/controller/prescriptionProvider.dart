import 'package:flutter/cupertino.dart';
import 'package:just_medical_center_automation/model/res/patient/prescriptionResponse.dart';
import 'package:just_medical_center_automation/services/helper/prescriptionHelper.dart';


class PrescriptionNotifier extends ChangeNotifier {
  List<PrescriptionResponse> _prescriptions = [];
  bool _isLoaded = false; // To ensure data is only fetched once

  List<PrescriptionResponse> get prescriptions => _prescriptions;

  Future<void> getAllPrescriptions() async {
    if (_isLoaded) return; // Prevent re-fetching
    try {
      _prescriptions = await PrescriptionHelper.getAllPrescription();
      _isLoaded = true; // Mark data as loaded
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching prescriptions: $e');
    }
  }

  // access individual prescription
  PrescriptionResponse? _prescription;

  PrescriptionResponse? get prescription => _prescription;
  void setPrescriptionData(PrescriptionResponse prescription)
  {
    _prescription = prescription;
    notifyListeners();
  }
}