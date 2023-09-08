import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jamaathi/Component/AppTheme.dart';
import 'package:jamaathi/Controller/ListOfMosquesController.dart';

class ListOfMosques extends GetView<ListOfMosquesController> {
  ListOfMosques({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ListOfMosquesController listOfMosquesController =
        Get.put(ListOfMosquesController());
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (!controller.isAddCall) {
        controller.isAddCall = true;
        controller.getList();
      }
    });
    return GetBuilder<ListOfMosquesController>(
      init: ListOfMosquesController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppTheme.liteGreenColor,
            appBar: PreferredSize(
              preferredSize: Size(100, 70),
              child: AppBar(
                automaticallyImplyLeading: false,
                bottomOpacity: 0.0,
                elevation: 0.0,
                flexibleSpace: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppTheme.appColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 23,
                                  ),
                                  Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.20,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.30,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Image(
                                image: AssetImage('assets/images/logo.png'),
                                fit: BoxFit.cover,
                                // width: width * 0.2,
                                // height: height * 0.9,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                'List of Mosques',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            body: SingleChildScrollView(
              // scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       'List Of Mosques',
                    //       style: TextStyle(
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.black),
                    //     )
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                  child: Image.asset(
                                    'assets/images/mosquesImage.png',
                                    fit: BoxFit.cover,
                                    height: height * 0.2,
                                    width: width * 0.9,
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: AppTheme.backColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                            " MASJID-E-ISLAH & MADRASA (Hanafi)\n"
                                            " 9, Jayalakshmi Nagar, Anna 1st street\n"
                                            " Nerkundram, Chennai- 600 109",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.30,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: controller.listOfMosques.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller
                                                    .listOfMosques[index].name,
                                                style: TextStyle(
                                                  color: AppTheme.textColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller
                                                    .listOfMosques[index].time,
                                                style: TextStyle(
                                                  color: AppTheme.textColor,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Column(
                              children: [
                                Text(
                                  'AZAAN',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.30,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount:
                                        controller.listOfAzaanTime.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Container(
                                            height: height * 0.04,
                                            width: width * 0.2,
                                            decoration: BoxDecoration(
                                                color: AppTheme.redColor,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Center(
                                              child: Text(
                                                controller
                                                    .listOfAzaanTime[index]
                                                    .time,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'IQAAMATH',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.30,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount:
                                        controller.listOfIqaamathTime.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Container(
                                            height: height * 0.04,
                                            width: width * 0.2,
                                            decoration: BoxDecoration(
                                                color: AppTheme.greenColor,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Center(
                                                  child: Text(
                                                    controller
                                                        .listOfIqaamathTime[
                                                            index]
                                                        .time,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.30,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      FloatingActionButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.notifications_active,
                                          color: Colors.white,
                                        ),
                                        backgroundColor: AppTheme.appColor,
                                      ),
                                      FloatingActionButton(
                                        onPressed: () {},
                                        child: Center(
                                          child: SvgPicture.asset(
                                            'assets/images/location-arrow-svgrepo-com(2).svg',
                                            height: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                        backgroundColor: AppTheme.appColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Lasted updated 1 hr ago',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            )
                          ],
                        )
                      ],
                    )
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
