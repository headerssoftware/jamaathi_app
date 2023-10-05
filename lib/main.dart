import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jamaathi/Component/AppPreference.dart';
import 'package:jamaathi/UI/HomeScreen.dart';
import 'package:jamaathi/UI/LoginScreen.dart';
import 'package:jamaathi/firebase_options.dart';
import 'package:jamaathi/routes/AppPages.dart';
import 'package:jamaathi/routes/AppRoutes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference().init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // NotificationSettings settings = await messaging.requestPermission();
  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  _firebaseMessaging.getToken().then((String? token) {
    assert(token != null);
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("onMessagedata: ${message.notification?.title}");
    print("onMessagenotification: ${message.notification?.body}");
  });

  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //   print("onMessageOpenedApp2data: ${message.notification?.title}");
  //   print("onMessageOpenedApp2notification: ${message.notification?.body}");
  // });

  // Called when the app is in background state

  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
  //   await backgroundHandler(message);
  //   print("onMessagedata: ${message.data}");
  //   print("onMessagenotification: ${message.notification}");
  // });
  //
  // // Called when the app is in foreground (open)
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
  //   await backgroundHandler(message);
  //   print("onMessageOpenedApp2data: ${message.data}");
  //   print("onMessageOpenedApp2notification: ${message.notification}");
  // });

  // final context = SecurityContext.defaultContext;
  // context.allowLegacyUnsafeRenegotiation = true;
  // final httpClient = HttpClient(context: context);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF003230),
      statusBarIconBrightness: Brightness.light,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppPreference().getUserId == null || AppPreference().getUserId == 0
          ? LoginScreen()
          : HomeScreen(),
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: '',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute:
          AppPreference().getUserId == null || AppPreference().getUserId == 0
              ? AppRoutes.root.toName
              : AppRoutes.home.toName,
      getPages: AppPages.list,
    );
  }
}
