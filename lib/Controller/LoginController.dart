import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  TextEditingController passwordController = TextEditingController();
  RxBool isVisible = false.obs;
  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }
}
