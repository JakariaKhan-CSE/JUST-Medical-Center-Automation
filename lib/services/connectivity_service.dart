import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
/*
Create a service to handle internet connectivity checks in your app. This service will use Stream to listen for connectivity changes and show an alert dialog if there’s no internet connection.
 */
class ConnectivityService {
  ConnectivityService._privateConstructor();
  static final ConnectivityService _instance = ConnectivityService._privateConstructor();
  static ConnectivityService get instance => _instance;

  final Connectivity _connectivity = Connectivity();
  //Stream<List<ConnectivityResult>>: The stream now expects
  // a list of ConnectivityResult objects. In the listener,
  // you access the first item from the list (resultList.first)
  // because the stream returns a list with one element representing
  // the current connectivity status.
  late Stream<List<ConnectivityResult>> _connectivityStream;

  void initialize() {
    _connectivityStream = _connectivity.onConnectivityChanged.asBroadcastStream();
    _connectivityStream.listen((List<ConnectivityResult> resultList) {
      // The stream returns a list, so handle the first element of the list
      ConnectivityResult result = resultList.first;

      if (result == ConnectivityResult.none) {
        _showNoInternetDialog();
      } else {
        // Dismiss the dialog if connectivity is restored
        if (Get.isDialogOpen ?? false) Get.back();
      }
    });
  }

  void _showNoInternetDialog() {
    if (Get.isDialogOpen ?? false) return; // Avoid multiple dialogs

    Get.dialog(
      AlertDialog(
        title: Text("No Internet Connection"),
        content: Text("Please check your internet connection."),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: Text("OK"),
          ),
        ],
      ),
      // alert dialog er baire click korle remove hobe na
      barrierDismissible: false, // Prevent dialog from being dismissed
    );
  }
}
