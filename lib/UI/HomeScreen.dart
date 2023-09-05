import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamaathi/Component/AppTheme.dart';
import 'package:jamaathi/Controller/HomeScreenController.dart';
import 'package:jamaathi/routes/AppRoutes.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    HomeScreenController homeController = Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize:
                  Size(100, 70), // Set the desired height for the AppBar
              child: AppBar(
                automaticallyImplyLeading: false,
                leading: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 23,
                        ),
                        Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ],
                    )),
                bottomOpacity: 0.0,
                elevation: 0.0,
                flexibleSpace: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.5),
                    //     spreadRadius: 2.0,
                    //     blurRadius: 1.0,
                    //     offset: Offset(0, 2), // Set the elevation values
                    //   ),
                    // ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      Image(
                        image: AssetImage('assets/images/logo.png'),
                        height: 90.0,
                      ),
                    ],
                  ),
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Prayers',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.listMosques.toName);
                      },
                      child: Row(
                        children: [
                          Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppTheme.liteGreenColor),
                              child: Stack(
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(4.0),
                                      child: Center(
                                        child: Icon(
                                          Icons.mosque_sharp,
                                          color: AppTheme.iconColor,
                                          size: 40,
                                        ),
                                      )),
                                ],
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Mosques",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppTheme.liteGreenColor),
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Center(
                                      child: Icon(
                                        Icons.access_time_sharp,
                                        color: AppTheme.iconColor,
                                        size: 40,
                                      ),
                                    )),
                              ],
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Prayer Times",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppTheme.liteGreenColor),
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Center(
                                      child: Icon(
                                        Icons.menu_book,
                                        color: AppTheme.iconColor,
                                        size: 40,
                                      ),
                                    )),
                              ],
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Quran",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppTheme.liteGreenColor),
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Center(
                                      child: Icon(
                                        Icons.quora,
                                        color: AppTheme.iconColor,
                                        size: 40,
                                      ),
                                    )),
                              ],
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Tasbih",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppTheme.liteGreenColor),
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Center(
                                      child: Icon(
                                        Icons.quora,
                                        color: AppTheme.iconColor,
                                        size: 40,
                                      ),
                                    )),
                              ],
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Qibla",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppTheme.liteGreenColor),
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Center(
                                      child: Icon(
                                        Icons.waving_hand,
                                        color: AppTheme.iconColor,
                                        size: 40,
                                      ),
                                    )),
                              ],
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Duas",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
