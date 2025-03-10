import 'package:just_medical_center_automation/controller/adminController/adminDataController.dart';
import 'package:just_medical_center_automation/exports.dart';

class SearchUserScreen extends StatefulWidget {
  const SearchUserScreen({super.key});

  @override
  State<SearchUserScreen> createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  @override
  Widget build(BuildContext context) {
    final _adminDataNotifier = Provider.of<AdminDataNotifier>(context);

    // Display patient data from the provider
    final userByRole = _adminDataNotifier.anyUser;
    // Utility function to capitalize the first letter and make the rest lowercase
    String capitalizeFirstLetter(String text) {
      if (text.isEmpty) return text; // Handle empty string case
      return text[0].toUpperCase() + text.substring(1).toLowerCase();
    }
    return Scaffold(
      backgroundColor: Colors.grey,
body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Card(
      elevation: 15,
      child: Container(
        height: 410,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(userByRole?.profile??'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNNLEL-qmmLeFR1nxJuepFOgPYfnwHR56vcw&s'),
                ),
                SizedBox(height: 10,),
                Text(capitalizeFirstLetter(userByRole?.role??''),style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 28
                ),),
                SizedBox(height: 10,),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Name'),
                    Text(userByRole?.name??''),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Email'),
                    Text(userByRole?.email??''),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Password'),
                    Text(userByRole?.password??''),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ID'),
                    Text(userByRole?.iD??''),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('isVerified'),
                    Text(userByRole?.isVerified??false==true ? 'Yes' : 'No'),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('isUpdateProfile'),
                    Text(userByRole?.isUpdateProfile??false==true ? 'Yes' : 'No'),
                  ],
                ),
  
  
              ],
            ),
          ),
        ),
      ),
    ),
  ),
),
    );
  }
}
