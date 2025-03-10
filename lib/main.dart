import 'package:just_medical_center_automation/controller/adminController/adminDataController.dart';

import 'exports.dart';
/*
In your main.dart file, initialize the ConnectivityService before
running the app. This will ensure that connectivity checking
is active throughout the app lifecycle.
 */
Widget defaultHome = const LoginPage();

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  // prottek page a internet connection check kora lagbe na
  // ai main function theke alltime monitoring korbe
  ConnectivityService.instance.initialize();  // void initialize() call hosse
  /*
  Centralized: The connectivity check and alert are handled in one place, reducing the need to add code on every page.
Performance: With this setup, there’s no need to create multiple connectivity listeners across different pages.
User Experience: Users will see the connectivity status regardless of where they are in the app.
   */
  try{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }catch(e)
  {
    print('error is: $e');
  }
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // // final entrypoint = prefs.getBool('entrypoint')??false;  // this is useful when use onBoarding Screen
  // final loggedIn = prefs.getBool('loggedIn')??false;
  // final role = prefs.getString('role')??'patient';
  // if(loggedIn)
  // {
  //   defaultHome =  MainScreen(role: role,); // local storage e loggedIn true thakle bar bar app open korar somoi login screen show korbe na. MainScreen a cole jabe
  // }
  // else{
  //   defaultHome = const LoginPage();
  // }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => IndexChangeProvider(),),
    ChangeNotifierProvider(create: (context) => AdminController(),),
    ChangeNotifierProvider(create: (context) => DoctorController(),),
    ChangeNotifierProvider(create: (context) => PharmacistController(),),
    ChangeNotifierProvider(create: (context) => CommonController(),),
    ChangeNotifierProvider(create: (context) => LabTechnicianController(),),
    ChangeNotifierProvider(create: (context) => ImageUploader(),),
    ChangeNotifierProvider(create: (context) => LoginNotifier(),),
    ChangeNotifierProvider(create: (context) => SignUpNotifier(),),
    ChangeNotifierProvider(create: (context) => ProfileNotifier(),),
    ChangeNotifierProvider(create: (context) => DoctorNotifier(),),
    ChangeNotifierProvider(create: (context) => PrescriptionNotifier(),),
    ChangeNotifierProvider(create: (context) => ImageUploaderDoctor(),),
    ChangeNotifierProvider(create: (context) => DoctorDataController(),),
    ChangeNotifierProvider(create: (context) => AdminDataNotifier(),),
  ],
  child: GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),

    home: SplashScreen(),

  ),
  ),

  );
}

