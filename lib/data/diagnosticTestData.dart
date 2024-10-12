class DiagonasticData{
  final DateTime dateTime;
  final String labTechnicianName;
  final String reportImageUrl;
  DiagonasticData({required this.dateTime, required this.labTechnicianName, required this.reportImageUrl});
}
// patient LabTestReport(collection name) -> document (ID) -> date
List<DiagonasticData> labDiagnosticDataList = [
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Abdul khalek",
      reportImageUrl: "https://images.drlogy.com/assets/uploads/img/general/drlogy-app/CSF%20Examination%20Example,%20Format,%20Sample%20and%20Template%20-%20Drlogy%20Lab%20Reports.webp"
  ),
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Abdul khalek",
      reportImageUrl: "https://blogs.doctorspatholab.com/content/images/2023/10/CBC-generic-report.png"
  ),
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Romel",
    reportImageUrl: "https://ars.els-cdn.com/content/image/1-s2.0-S0009898118303711-gr2.jpg"
  ),
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Romel",
    reportImageUrl: "https://www.researchgate.net/publication/319357366/figure/fig2/AS:613886776573952@1523373421045/The-consolidated-theranostic-report-surgical-pathology-An-example-deidentified-to.png"
  ),
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Abdul khalek",
      reportImageUrl: "https://www.wisconsindiagnostic.com/assets/images/report-front.jpg"
  ),
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Abdul khalek",
      reportImageUrl: "https://images.drlogy.com/assets/uploads/img/general/drlogy-app/CSF%20Examination%20Example,%20Format,%20Sample%20and%20Template%20-%20Drlogy%20Lab%20Reports.webp"
  ),
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Abdul khalek",
      reportImageUrl: "https://blogs.doctorspatholab.com/content/images/2023/10/CBC-generic-report.png"
  ),
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Romel",
      reportImageUrl: "https://ars.els-cdn.com/content/image/1-s2.0-S0009898118303711-gr2.jpg"
  ),
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Romel",
      reportImageUrl: "https://www.researchgate.net/publication/319357366/figure/fig2/AS:613886776573952@1523373421045/The-consolidated-theranostic-report-surgical-pathology-An-example-deidentified-to.png"
  ),
  DiagonasticData(
      dateTime: DateTime.now(),
      labTechnicianName: "Abdul khalek",
      reportImageUrl: "https://www.wisconsindiagnostic.com/assets/images/report-front.jpg"
  ),
];