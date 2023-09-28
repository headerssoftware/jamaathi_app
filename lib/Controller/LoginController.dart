import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:jamaathi/Api%20Connect/ApiConnect.dart';
import 'package:jamaathi/Component/AppPreference.dart';
import 'package:jamaathi/routes/AppRoutes.dart';

class LoginController extends GetxController {
  final deviceInfo = DeviceInfoPlugin();
  RxBool isVisible = false.obs;
  RxString osVersion = RxString("");
  RxString formattedDateTime = RxString("");
  String token = "";
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> retrieveFCMToken() async {
    token = (await messaging.getToken())!;
    print("FCMToken: $token");
  }

  Future<String> getCurrentTime() async {
    final now = DateTime.now();
    var dateFormatted = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(now);
    print('object:$dateFormatted');
    formattedDateTime.value = dateFormatted;
    return dateFormatted;
  }

  @override
  void onInit() async {
    super.onInit();
    version();
    getCurrentTime();
    retrieveFCMToken();
  }

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }

  final ApiConnect _connect = Get.put(ApiConnect());
  RxBool isLoading = RxBool(false);
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  RxBool username = RxBool(false);

  loginApiCall() async {
    try {
      username.value = false;
      if (usernameController.value.text.isEmpty) {
        username.value = true;
        Fluttertoast.showToast(
          msg: "Please enter Username!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
        return;
      }
      Map<String, dynamic> payload = {
        "userId": 0,
        "userName": usernameController.value.text.toString(),
        "userFcmId": token,
        "userLastLogin": formattedDateTime.value,
        "osTypeId": Platform.isIOS ? 2 : 1,
        "osVersion": osVersion.value,
      };
      var response = await _connect.login(payload);
      debugPrint("loginCall: ${response.toJson()}");
      if (response.userId != null) {
        AppPreference().updateUserId(response.userId!);
        AppPreference().updateUserName(response.userName!);
        Fluttertoast.showToast(
          msg: 'Success!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
        Get.toNamed(AppRoutes.home.toName);
      } else {
        if (response == false) {
          Fluttertoast.showToast(
            msg: 'Failed!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black,
            textColor: Colors.white,
          );
        }
      }
      print(payload);
    } catch (e) {}
  }

  Future<void> version() async {
    if (Platform.isIOS) {
      osVersion.value = Platform.operatingSystemVersion.toString();
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      osVersion.value = androidInfo.version.release.toString();
    }
  }
}
