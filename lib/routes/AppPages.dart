import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:jamaathi/Binding/HomeScreenBinding.dart';
import 'package:jamaathi/Binding/ListOfMosquesBinding.dart';
import 'package:jamaathi/UI/HomeScreen.dart';
import 'package:jamaathi/UI/ListOfMosques.dart';

import 'package:jamaathi/routes/AppRoutes.dart';
import '../Binding/LoginScreenBinding.dart';
import '../UI/LoginScreen.dart';

class AppPages {
  static var list = [
    GetPage(
        name: AppRoutes.root.toName,
        page: () => LoginScreen(),
        binding: LoginScreenBinding()),
    GetPage(
        name: AppRoutes.home.toName,
        page: () => HomeScreen(),
        binding: HomeScreenBinding()),
    GetPage(
        name: AppRoutes.listMosques.toName,
        page: () => ListOfMosques(),
        binding: ListOfMosquesBinding()),
  ];
}
