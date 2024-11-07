class JUSTMedicalServiceData{
  final String testName;
  final int rate;

  JUSTMedicalServiceData({
    required this.testName, required this.rate
});
}

List<JUSTMedicalServiceData> allServicesData = [
  JUSTMedicalServiceData(testName: "Blood Grouping/RBC/FBS", rate: 70),
  JUSTMedicalServiceData(testName: "TC,DC/ESR/HB)	", rate: 100),
  JUSTMedicalServiceData(testName: "OGTT (2 sample)	", rate: 140),
  JUSTMedicalServiceData(testName: "BT, CT/MT for TB", rate: 120	),
  JUSTMedicalServiceData(testName: "Urine PT", rate: 100	),
  JUSTMedicalServiceData(testName: "Urine Sugar/Protein", rate: 100	),
  JUSTMedicalServiceData(testName: "Urine RME (Manual)", rate: 120	),
  JUSTMedicalServiceData(testName: "Urine RME (Auto)", rate: 170	),
  JUSTMedicalServiceData(testName: "Total Bilirubin	", rate: 185	),
  JUSTMedicalServiceData(testName: "SGPT", rate: 185	),
  JUSTMedicalServiceData(testName: "ALP", rate: 185	),
  JUSTMedicalServiceData(testName: "S. Creatinie	", rate: 185	),
  JUSTMedicalServiceData(testName: "Uric Acid", rate: 185	),
  JUSTMedicalServiceData(testName: "S. Cholesterol	", rate: 185	),
  JUSTMedicalServiceData(testName: "TG (Triglycerides)", rate: 185	),
  JUSTMedicalServiceData(testName: "RA Test	", rate: 230	),
  JUSTMedicalServiceData(testName: "HBs Ag	", rate: 230	),
  JUSTMedicalServiceData(testName: "HCV/HIV	", rate: 230	),
  JUSTMedicalServiceData(testName: "ASO", rate: 285	),
  JUSTMedicalServiceData(testName: "VDRL", rate: 285	),
  JUSTMedicalServiceData(testName: "TPHA", rate: 285	),
  JUSTMedicalServiceData(testName: "WIDAL", rate: 285	),
  JUSTMedicalServiceData(testName: "CRP", rate: 285	),
  JUSTMedicalServiceData(testName: "Dengue NSI", rate: 300	),
  JUSTMedicalServiceData(testName: "Dengue IgG/IgM	", rate: 300	),
  JUSTMedicalServiceData(testName: "CBC (manual)", rate: 185	),
];