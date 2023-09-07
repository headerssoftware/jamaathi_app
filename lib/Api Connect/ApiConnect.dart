import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:jamaathi/Api%20Configuration/ApiUrl.dart';
import 'package:jamaathi/Api%20Configuration/HttpService.dart';
import 'package:jamaathi/Api%20Connect/JsonResponse/LoginResponse.dart';
import 'package:jamaathi/Component/AppUtility.dart';

class ApiConnect extends GetConnect {
  HttpService httpService = HttpService();

  @override
  onInit() async {
    await httpService.init();
    super.onInit();
  }

  Future<LoginResponse> login(Map<String, dynamic> payload) async {
    httpService.init();

    print(payload);

    var response = await httpService.request(
        url: ApiUrl.login, method: Method.POST, params: payload);

    print(response);

    if (response is dio.Response) {
      if (response.data == null) {
        throw Exception(AppUtility.connectivityMessage);
      }
      return LoginResponse.fromJson(response.data);
    }

    return LoginResponse();
  }
}
