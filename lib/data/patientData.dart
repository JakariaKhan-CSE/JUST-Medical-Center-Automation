class Patient{
  final String name;
  final int ID;
  final int age;
  final String department;
  late String? picture;

  Patient({required this.name, required this.ID, required this.age,this.picture, required this.department});
}

List<Patient> patientList = [
  Patient(name: 'Jakaria', ID: 190152, age: 24, department: 'CSE'),
  Patient(name: 'khan', ID: 190001, age: 24,department: 'NFT'),
  Patient(name: 'Supto', ID: 194568, age: 24,department: 'EEE'),
  Patient(name: 'Rahim', ID: 190178, age: 24,department: 'FMB'),
  Patient(name: 'Karim', ID: 190187, age: 65,department: 'APPT'),
  Patient(name: 'Asif', ID: 190145, age: 24,department: 'GBT'),
  Patient(name: 'Omar', ID: 190159, age: 68,department: 'CSE'),
  Patient(name: 'Abdullah', ID: 190152, age: 24,department: 'EEE'),
  Patient(name: 'Khalid', ID: 190152, age: 45, department: 'FMB'),
  Patient(name: 'Hamza', ID: 190152, age: 24,department: 'TLE'),
  Patient(name: 'Osman', ID: 190152, age: 39,department: 'MANAGEMENT'),
  Patient(name: 'Mustafa', ID: 190178, age: 35,department: 'MKT'),
  Patient(name: 'Abdul Hamid', ID: 190189, age: 36, department: 'ENGLISH'),
  Patient(name: 'Jakaria', ID: 190152, age: 24, department: 'CSE'),
  Patient(name: 'khan', ID: 190001, age: 24,department: 'NFT'),
  Patient(name: 'Supto', ID: 194568, age: 24,department: 'EEE'),
  Patient(name: 'Rahim', ID: 190178, age: 24,department: 'FMB'),
  Patient(name: 'Karim', ID: 190187, age: 65,department: 'APPT'),
  Patient(name: 'Asif', ID: 190145, age: 24,department: 'GBT'),
  Patient(name: 'Omar', ID: 190159, age: 68,department: 'CSE'),
  Patient(name: 'Abdullah', ID: 190152, age: 24,department: 'EEE'),
  Patient(name: 'Khalid', ID: 190152, age: 45, department: 'FMB'),
  Patient(name: 'Hamza', ID: 190152, age: 24,department: 'TLE'),
  Patient(name: 'Osman', ID: 190152, age: 39,department: 'MANAGEMENT'),
  Patient(name: 'Mustafa', ID: 190178, age: 35,department: 'MKT'),
  Patient(name: 'Abdul Hamid', ID: 190189, age: 36, department: 'ENGLISH'),
];