import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import 'package:starter_template_get_x/config/config.dart';
import 'package:starter_template_get_x/data/data.dart';
import 'package:starter_template_get_x/data/utils/custom_popup.dart';
import 'package:starter_template_get_x/presentation/presentation.dart';

void main() async {
  // Wait for bindings
  WidgetsFlutterBinding.ensureInitialized();

  await MySharedPref.init();

  // NOTE: When you will use firebase use this to init firebase
  await FirebaseHelper.initFirebase();

  // NOTE: When you want to awesome notifications uncomment this
  // await AwesomeNotificationsHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Starter Project',
      debugShowCheckedModeBanner: false,
      routingCallback: (value) {
        // NOTE: Used when we implement deep linking
        if (value!.current.contains("#")) {
          try {
            String urlString = value.current.split("#").last;
            Uri url = Uri.parse(urlString);
            Map<String, String> queryParams = url.queryParameters;
            Get.parameters = queryParams;
          } catch (e) {
            print(e);
          }
        }
      },
      builder: (context, child) {
        bool themeIsLight = MySharedPref.getThemeIsLight();
        return Theme(
          data: MyTheme.getThemeData(isLight: themeIsLight),
          child: child!,
        );
      },
      initialRoute: Routes.initialRoute,
      getPages: Routes.routes,
    );
  }
}
