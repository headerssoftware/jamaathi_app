import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamaathi/Controller/ListOfMosquesController.dart';

class ListOfMosques extends GetView<ListOfMosquesController> {
  ListOfMosques({super.key});
  @override
  Widget build(BuildContext context) {
    ListOfMosquesController listOfMosquesController =
        Get.put(ListOfMosquesController());
    return GetBuilder<ListOfMosquesController>(
      init: ListOfMosquesController(),
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
              reverse: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
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
