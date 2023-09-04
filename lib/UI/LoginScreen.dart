import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamaathi/Controller/LoginController.dart';
import '../Component/AppTheme.dart';
import '../Component/forms.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 23,
                      ),
                      Icon(Icons.arrow_back),
                    ],
                  )),
            ),
            backgroundColor: Colors.black,
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
                    TextField(
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Name',
                          labelStyle: TextStyle(
                              color: Colors.grey) // Add padding as needed
                          ),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() => TextField(
                          controller: controller.passwordController,
                          obscureText: !loginController.isVisible.value,
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.grey),
                              suffixIcon: InkWell(
                                onTap: () {
                                  loginController.toggleVisibility();
                                },
                                child: Icon(
                                  color: Colors.grey,
                                  loginController.isVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              )),
                          style: TextStyle(color: Colors.white),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Forgot Your Password?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Center(
                      child: Button(
                          widthFactor: 0.7,
                          heightFactor: 0.05,
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                          },
                          child: Text("Login",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Don't have an account yet?",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.toNamed(AppRoutes.Register.toName);
                          },
                          child: Text(
                            ' Sign Up',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.buttonColor,
                            ),
                          ),
                        ),
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
