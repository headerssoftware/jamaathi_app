import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:jamaathi/Api%20Connect/ApiConnect.dart';
import 'package:jamaathi/Api%20Connect/JsonResponse/GetMosquesList.dart';
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

  getList() async {
    isLoading.value = true;
    var response = await _connect.getMosques();
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
}
