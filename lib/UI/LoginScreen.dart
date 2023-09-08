import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamaathi/Component/AppTheme.dart';
import 'package:jamaathi/Controller/LoginController.dart';
import 'package:jamaathi/routes/AppRoutes.dart';
import '../Component/forms.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppTheme.liteGreenColor,
            appBar: PreferredSize(
              preferredSize:
                  Size(100, 70), // Set the desired height for the AppBar
              child: AppBar(
                automaticallyImplyLeading: false,
                leading: InkWell(
                  onTap: () {
                    Get.back();
                  },
                ),
                bottomOpacity: 0.0,
                elevation: 0.0,
                flexibleSpace: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppTheme.liteGreenColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    ],
                  ),
                ),
                backgroundColor: AppTheme.liteGreenColor,
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
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'USERNAME',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: TextFormField(
                          controller: controller.usernameController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black26,
                              ),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            label: Text('Enter your name '),
                            hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          textInputAction: TextInputAction.next,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Center(
                      child: Button(
                          widthFactor: 0.4,
                          heightFactor: 0.052,
                          onPressed: () {
                            controller.loginApiCall();
                            FocusScope.of(context).unfocus();
                          },
                          child: Text("LOGIN",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
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
