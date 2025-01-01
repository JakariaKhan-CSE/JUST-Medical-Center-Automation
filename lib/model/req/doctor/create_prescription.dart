import 'package:flutter/material.dart';

// this model specially design for post request(send data to backend)
// CreatePrescriptionRequest model
class CreatePrescriptionRequest {
  final List<Medicine> medicines;
  final String patientId;

  CreatePrescriptionRequest({
    required this.medicines,
    required this.patientId,
  });

  // Convert the request object to JSON
  Map<String, dynamic> toJson() {
    // 'medicines',
    //       'patientId'     same as backend otherwise get error
    return {
      'medicines': medicines.map((medicine) => medicine.toJson()).toList(),
      'patientId': patientId,
    };
  }
}

// Medicine model to represent each medicine item in the list
class Medicine {
  final String name;
  final int quantity;
  final bool morning;
  final bool lunch;
  final bool dinner;
  final bool beforeMeal; // true for before meal, false for after meal

  Medicine({
    required this.name,
    required this.quantity,
    this.morning = false,
    this.lunch = false,
    this.dinner = false,
    this.beforeMeal = false,
  });

  // Convert the Medicine object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'morning': morning,
      'lunch': lunch,
      'dinner': dinner,
      'beforeMeal': beforeMeal,
    };
  }

  // Create a Medicine object from JSON
  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      name: json['name'],
      quantity: json['quantity'],
      morning: json['morning'] ?? false,
      lunch: json['lunch'] ?? false,
      dinner: json['dinner'] ?? false,
      beforeMeal: json['beforeMeal'] ?? false,
    );
  }
}

