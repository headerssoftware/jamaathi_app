import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jamaathi/Component/AppTheme.dart';
import 'package:jamaathi/Component/widget_theme.dart';
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
            body: Obx(
              () => controller.isLoading.value
                  ? loadingWidget()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                CarouselSlider.builder(
                                  itemCount: 5,
                                  options: CarouselOptions(
                                      enlargeCenterPage: true,
                                      autoPlay: false,
                                      aspectRatio: 12 / 24,
                                      autoPlayAnimationDuration:
                                          Duration(seconds: 2),
                                      viewportFraction: 1),
                                  itemBuilder: (BuildContext context, int index,
                                      int realIndex) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Card(
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0),
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
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.1,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                decoration: BoxDecoration(
                                                  color: AppTheme.backColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10.0),
                                                    bottomRight:
                                                        Radius.circular(10.0),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                            controller
                                                                .data[index]!
                                                                .masjidName!,
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400)),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          controller.data[index]
                                                              .masjidLocation!,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          controller.data[index]
                                                              .masjidAddress!,
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          controller.data[index]
                                                              .masjidPincode!,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                        ),

                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'AZAAN',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 40,
                                                ),
                                                Text(
                                                  'IQAAMATH',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.4,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              child: ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: controller
                                                      .data[index]
                                                      .waqthDetails!
                                                      .length!,
                                                  itemBuilder:
                                                      (context, index1) {
                                                    return Container(
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        controller
                                                                            .data[index]
                                                                            .waqthDetails![index1]
                                                                            .waqthName!,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              AppTheme.textColor,
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        controller
                                                                            .data[index]
                                                                            .waqthDetails![index1]
                                                                            .startTime!,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              AppTheme.textColor,
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        controller
                                                                            .data[index]
                                                                            .waqthDetails![index1]
                                                                            .endTime!,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              AppTheme.textColor,
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                width: 30,
                                                              ),
                                                              Column(
                                                                children: [
                                                                  Container(
                                                                    height:
                                                                        height *
                                                                            0.04,
                                                                    width:
                                                                        width *
                                                                            0.2,
                                                                    decoration: BoxDecoration(
                                                                        color: AppTheme
                                                                            .redColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(20)),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        controller
                                                                            .data[index]
                                                                            .waqthDetails![index1]
                                                                            .azanTime!,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              Container(
                                                                height: height *
                                                                    0.04,
                                                                width: width *
                                                                    0.19,
                                                                decoration: BoxDecoration(
                                                                    color: AppTheme
                                                                        .greenColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20)),
                                                                child: Center(
                                                                  child: Text(
                                                                    controller
                                                                        .data[
                                                                            index]
                                                                        .waqthDetails![
                                                                            index1]
                                                                        .iqaamathTime!,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 0,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          ],
                                        ),

                                        // SizedBox(
                                        //   height: 05,
                                        // ),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.end,
                                        //   children: [
                                        //     Text(
                                        //       'Lasted updated 1 hr ago',
                                        //       style: TextStyle(
                                        //         fontStyle: FontStyle.italic,
                                        //         fontWeight: FontWeight.w400,
                                        //         fontSize: 12,
                                        //         color: Colors.black,
                                        //       ),
                                        //     )
                                        //   ],
                                        // )
                                      ],
                                    );

                                    // Image.network(
                                    //  '',
                                    //  // controller.listOfImages[index],
                                    //  fit: BoxFit.cover,
                                  },
                                ),
                              ],
                            ),
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
