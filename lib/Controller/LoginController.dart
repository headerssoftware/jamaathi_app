import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jamaathi/Api%20Connect/ApiConnect.dart';
import 'package:jamaathi/Component/AppPreference.dart';
import 'package:jamaathi/routes/AppRoutes.dart';

class LoginController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  RxBool isVisible = false.obs;

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
        "userFcmId": "string",
        "userLastLogin": "2023-09-07T10:36:51.709Z",
        "osTypeId": 1,
        "osVersion": "string"
      };

      var response = await _connect.login(payload);
      debugPrint("loginCall: ${response.toJson()}");
      if (response.userId != null) {
        Fluttertoast.showToast(
          msg: 'Success!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
        Get.toNamed(AppRoutes.home.toName);
        // AppPreference().updateUserId(response!.userId!);
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
}
