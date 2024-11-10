import 'package:flutter/cupertino.dart';

import '../../model/res/auth/profile response.dart';
import '../../services/helper/authHelper.dart';

class ProfileNotifier extends ChangeNotifier{
  Future<ProfileResponse>? profile;
  getProfile()async{
    profile =  AuthHelper.getProfile();
  }
}