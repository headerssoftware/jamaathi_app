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
import 'package:url_launcher/url_launcher.dart';

class ListOfMosquesController extends GetxController {
  final CarouselController carouselController = CarouselController();
  final ApiConnect _connect = Get.put(ApiConnect());
  RxBool isLoading = RxBool(true);
  String latitude = "";
  String longitude = "";
  bool isAddCall = false;
  List<GetMosquesList> data = [];
  RxBool isVisible = false.obs;
  RxInt selectedIndex = RxInt(0);
  RxString value = RxString("");
  @override
  void onInit() async {
    super.onInit();
  }

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }

  String Time(String time) {
    DateTime dateTime = DateFormat("HH:mm:ss").parse(time);
    // Format the DateTime object as "hh:mm" (12-hour format)
    String formattedTime = DateFormat("hh:mm").format(dateTime);
    print('FormattedDateandTime: $formattedTime');
    return formattedTime;
  }

  String getHours(String man) {
    DateTime now = DateTime.now();
    String formattedTime =
        DateFormat("h").format(now); // 'h:mm a' for 12-hour format with AM/PM
    print('Current Time: $formattedTime');
    return formattedTime;
  }

  String getLastUpdateMessage(String updateTime) {
    DateTime now = DateTime.now();
    try {
      DateTime lastUpdate =
          DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(updateTime);
      int differenceInMinutes = now.difference(lastUpdate).inMinutes;
      if (differenceInMinutes < 1) {
        return "Just now";
      } else if (differenceInMinutes < 60) {
        return "Last updated $differenceInMinutes minutes ago";
      } else if (differenceInMinutes < 1440) {
        int hours = differenceInMinutes ~/ 60;
        return "Last updated $hours hours ago";
      } else {
        int days = differenceInMinutes ~/ 1440;
        return "Last updated $days days ago";
      }
    } catch (e) {
      return "Invalid datsacadse format";
    }
  }

  void main() {
    String updateTime = "2023-10-03T12:30:00";
    String message = getLastUpdateMessage(updateTime);
    print(message); // Print the message
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
        msg: '',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
      );
    }
  }

  Future<void> refreshData() async {
    getList();
    return Future.delayed(Duration(seconds: 0));
  }

  Future<void> openMap() async {
    print('object');
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=${Uri.encodeFull('$latitude,$longitude')}';
    print('Opening map with URL: $googleUrl');
    launchUrl(Uri.parse(googleUrl)).onError(
      (error, stackTrace) {
        print("Url is not valid!");
        return false;
      },
    );
  }

  subscribed(int masjidId) async {
    Map<String, dynamic> payload = {
      "userMasjidId": 0,
      "userId": AppPreference().getUserId,
      "masjidId": masjidId
    };
    isLoading.value = true;
    var response = await _connect.subscribedApiConnect(payload);
    isLoading.value = false;
    getList();
    debugPrint("subscuribelAPi: ${response.toJson()}");
    if (response != null) {
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
    print('object');
    String url = ApiUrl.subscribeDelete + msId.toString();
    debugPrint("DELETEAPIURL: ${ApiUrl.subscribeDelete}");
    final response = await _connect.deleteApiConnect(url);
    debugPrint("deleteCall: ${response}");
    getList();
    if (response!) {
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
