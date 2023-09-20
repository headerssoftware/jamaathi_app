import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:jamaathi/Api%20Configuration/ApiUrl.dart';
import 'package:jamaathi/Api%20Configuration/HttpService.dart';
import 'package:jamaathi/Api%20Connect/JsonResponse/GetMosquesList.dart';
import 'package:jamaathi/Api%20Connect/JsonResponse/LoginResponse.dart';
import 'package:jamaathi/Api%20Connect/JsonResponse/subscribedResponse.dart';
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
    var response = await httpService.request(
        url: ApiUrl.login, method: Method.POST, params: payload);
    if (response is dio.Response) {
      if (response.data == null) {
        throw Exception(AppUtility.connectivityMessage);
      }
      return LoginResponse.fromJson(response.data);
    }
    return LoginResponse();
  }

  Future<List<GetMosquesList>> getMosques() async {
    var listResponse =
        await httpService.request(url: ApiUrl.mosquesList, method: Method.GET);
    if (listResponse is dio.Response) {
      print('LISTOFMOS$listResponse');
      if (listResponse.data == null) {
        throw Exception(AppUtility.connectivityMessage);
      }
      List<Map<String, dynamic>> responseDataList =
          List<Map<String, dynamic>>.from(listResponse.data);
      List<GetMosquesList> mosquesList = responseDataList
          .map((data) => GetMosquesList.fromJson(data))
          .toList();
      return mosquesList;
    }
    return [];
  }

  Future<subscribedResponse> subscribedApiConnect(
      Map<String, dynamic> payload) async {
    httpService.init();
    var response = await httpService.request(
        url: ApiUrl.subscribedUrl, method: Method.POST, params: payload);
    if (response is dio.Response) {
      if (response.data == null) {
        throw Exception(AppUtility.connectivityMessage);
      }
      return subscribedResponse.fromJson(response.data);
    }
    return subscribedResponse();
  }

  Future<dynamic> deleteApiConnect() async {
    httpService.init();
    var response = await httpService.request(
        url: ApiUrl.subscribeDelete, method: Method.DELETE);
    if (response.statusCode == 200) {
      return true;
    }
    if (response.statusCode == 400) {
      return false;
    }
  }

// Future<dynamic> deleteApiConnect(String url) async {
//   try {
//     // Send the DELETE request
//     final response = await dio.delete(url);
//
//     if (response.statusCode == 200) {
//       // Successful DELETE request, return the response data (if any)
//       return response.data;
//     } else {
//       // Handle other status codes as needed
//       throw Exception('Failed to delete data: ${response.statusCode}');
//     }
//   } catch (e) {
//     // Handle exceptions
//     throw Exception('Failed to delete data: $e');
//   }
// }
}
