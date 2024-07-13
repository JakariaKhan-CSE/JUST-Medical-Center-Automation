import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/screen/Admin/sidebar.dart';

import '../../widget/admin/adminPicture.dart';
import '../../widget/admin/featureItemButton.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 2,
              child: SideBar()
          ),
          Expanded(
              flex: 7,
              child: Container(color: Colors.green.withOpacity(0.3),))
        ],
      ),
    );
  }
}






