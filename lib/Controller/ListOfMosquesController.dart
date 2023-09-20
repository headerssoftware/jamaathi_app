import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:jamaathi/Api%20Configuration/ApiUrl.dart';
import 'package:jamaathi/Api%20Connect/ApiConnect.dart';
import 'package:jamaathi/Api%20Connect/JsonResponse/GetMosquesList.dart';
import 'package:jamaathi/Component/AppPreference.dart';
import 'package:jamaathi/Component/MosquesList.dart';

class ListOfMosquesController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  String Time(String time) {
    DateTime dateTime = DateFormat("HH:mm:ss").parse(time);

    // Format the DateTime object as "hh:mm" (12-hour format)
    String formattedTime = DateFormat("hh:mm").format(dateTime);
    print('FormattedDateandTime: $formattedTime');

    return formattedTime;
  }

  final CarouselController carouselController = CarouselController();
  final ApiConnect _connect = Get.put(ApiConnect());
  RxBool isLoading = RxBool(true);
  bool isAddCall = false;
  List<GetMosquesList> data = [];
  RxBool isVisible = false.obs;

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }

  getList() async {
    isLoading.value = true;
    var response = await _connect.getMosques();
    debugPrint("fullResponces: ${response.length}");

    isLoading.value = false;
    if (response != null) {
      data = response;
    } else {
      Fluttertoast.showToast(
        msg: '!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
      );
    }
  }

  subscribed() async {
    Map<String, dynamic> payload = {
      "userMasjidId": 0,
      "userId": AppPreference().getUserId,
      "masjidId": 1
    };
    isLoading.value = true;
    var response = await _connect.subscribedApiConnect(payload);
    isLoading.value = false;
    debugPrint("loginCall: ${response.toJson()}");
    if (response != null) {
      Fluttertoast.showToast(
        msg: 'Success!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Failed!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    }
  }

  Future<void> deleteCall(int msId) async {
    ApiUrl.subscribeDelete = ApiUrl.subscribeDelete + msId.toString();
    final response = await _connect.deleteApiConnect;
    debugPrint("deleteCall: ${response}");
    if (response != null) {
      Fluttertoast.showToast(
        msg: 'Success!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Failed!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    }
  }
}
