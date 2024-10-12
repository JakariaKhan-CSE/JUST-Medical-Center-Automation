class DiagonasticData{
  final DateTime dateTime;
  final String labTechnicianName;
  final String reportImageUrl;
  DiagonasticData({required this.dateTime, required this.labTechnicianName, required this.reportImageUrl});
}
// patient LabTestReport(collection name) -> document (ID) -> date
List<DiagonasticData> labDiagnosticData = [
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Abdul khalek",
      reportImageUrl: "https://images.drlogy.com/assets/uploads/img/general/drlogy-app/CSF%20Examination%20Example,%20Format,%20Sample%20and%20Template%20-%20Drlogy%20Lab%20Reports.webp"
  ),
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Abdul khalek",
      reportImageUrl: "https://images.drlogy.com/assets/uploads/img/general/drlogy-app/CSF%20Examination%20Example,%20Format,%20Sample%20and%20Template%20-%20Drlogy%20Lab%20Reports.webp"
  ),
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Romel",
      reportImageUrl: "https://images.drlogy.com/assets/uploads/img/general/drlogy-app/CSF%20Examination%20Example,%20Format,%20Sample%20and%20Template%20-%20Drlogy%20Lab%20Reports.webp"
  ),
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Romel",
      reportImageUrl: "https://images.drlogy.com/assets/uploads/img/general/drlogy-app/CSF%20Examination%20Example,%20Format,%20Sample%20and%20Template%20-%20Drlogy%20Lab%20Reports.webp"
  ),
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Abdul khalek",
      reportImageUrl: "https://images.drlogy.com/assets/uploads/img/general/drlogy-app/CSF%20Examination%20Example,%20Format,%20Sample%20and%20Template%20-%20Drlogy%20Lab%20Reports.webp"
  ),
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Abdul khalek",
      reportImageUrl: "https://images.drlogy.com/assets/uploads/img/general/drlogy-app/CSF%20Examination%20Example,%20Format,%20Sample%20and%20Template%20-%20Drlogy%20Lab%20Reports.webp"
  ),
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Romel",
      reportImageUrl: "https://images.drlogy.com/assets/uploads/img/general/drlogy-app/CSF%20Examination%20Example,%20Format,%20Sample%20and%20Template%20-%20Drlogy%20Lab%20Reports.webp"
  ),
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Romel",
      reportImageUrl: "https://images.drlogy.com/assets/uploads/img/general/drlogy-app/CSF%20Examination%20Example,%20Format,%20Sample%20and%20Template%20-%20Drlogy%20Lab%20Reports.webp"
  ),
];