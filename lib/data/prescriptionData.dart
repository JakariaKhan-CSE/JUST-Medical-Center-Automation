import 'package:just_medical_center_automation/data/medicine%20data.dart';

class PrescriptionData{
  final DateTime dateTime;
  final MedicineData medicineData;
  final String doctorName;
  PrescriptionData({required this.dateTime, required this.medicineData, required this.doctorName});
}

List<PrescriptionData> prescriptionDataList = [
  PrescriptionData(dateTime: DateTime.now(),
      medicineData: MedicineData(
          Medicine_Name: "Prodep 20 mg",
          Quantity: 14),
      doctorName: "jakaria"),
  PrescriptionData(dateTime: DateTime.now(),
      medicineData: MedicineData(
          Medicine_Name: "Indever 10 mg",
          Quantity: 28),
      doctorName: "supto"),
  PrescriptionData(dateTime: DateTime.now(),
      medicineData: MedicineData(
          Medicine_Name: "Mirtaz 7.5 mg",
          Quantity: 14),
      doctorName: "jakaria"),
  PrescriptionData(dateTime: DateTime.now(),
      medicineData: MedicineData(
          Medicine_Name: "Zolax 0.5 mg",
          Quantity: 14),
      doctorName: "jakaria"),
  PrescriptionData(dateTime: DateTime.now(),
      medicineData: MedicineData(
          Medicine_Name: "Santogen (Multivitamin)",
          Quantity: 14),
      doctorName: "supto"),
  PrescriptionData(dateTime: DateTime.now(),
      medicineData: MedicineData(
          Medicine_Name: "Nexcital 20 mg",
          Quantity: 14),
      doctorName: "supto"),
  PrescriptionData(dateTime: DateTime.now(),
      medicineData: MedicineData(
          Medicine_Name: "Nofiate 200 mg",
          Quantity: 14),
      doctorName: "supto"),
  PrescriptionData(dateTime: DateTime.now(),
      medicineData: MedicineData(
          Medicine_Name: "Pregaba 75 mg",
          Quantity: 28),
      doctorName: "jakaria")
];