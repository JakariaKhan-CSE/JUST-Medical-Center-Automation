import 'dart:convert';

// CreatePrescriptionRequest model
class CreatePrescriptionRequest {
  final List<Medicine> medicines;
  final String patientId;

  CreatePrescriptionRequest({
    required this.medicines,
    required this.patientId,
  });

  // Convert the model to JSON
  Map<String, dynamic> toJson() {
    return {
      'medicines': medicines.map((medicine) => medicine.toJson()).toList(),
      'patientId': patientId,
    };
  }

  // Create the model from JSON (for response parsing if necessary)
  factory CreatePrescriptionRequest.fromJson(Map<String, dynamic> json) {
    var list = json['medicines'] as List;
    List<Medicine> medicinesList = list.map((i) => Medicine.fromJson(i)).toList();

    return CreatePrescriptionRequest(
      medicines: medicinesList,
      patientId: json['patientId'],
    );
  }
}

// Medicine model to represent each medicine item in the list
class Medicine {
  final String name;
  final int quantity;

  Medicine({
    required this.name,
    required this.quantity,
  });

  // Convert the Medicine object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
    };
  }

  // Create a Medicine object from JSON
  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      name: json['name'],
      quantity: json['quantity'],
    );
  }
}
