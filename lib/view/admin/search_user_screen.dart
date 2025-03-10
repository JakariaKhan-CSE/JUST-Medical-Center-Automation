import 'package:just_medical_center_automation/controller/adminController/adminDataController.dart';
import 'package:just_medical_center_automation/exports.dart';

class SearchUserScreen extends StatelessWidget {
  const SearchUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _adminDataNotifier = Provider.of<AdminDataNotifier>(context);

    // Display patient data from the provider
    final userByRole = _adminDataNotifier.anyUser;
    return Scaffold(
body: Column(
  children: [
    Text(userByRole?.name??''),
    Text(userByRole?.role??''),
    Text(userByRole?.email??''),
  ],
),
    );
  }
}
