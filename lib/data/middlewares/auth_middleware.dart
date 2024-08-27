import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../utils/routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // TODO: Put validation on if user is logged in or not
    // return StorageUtil.isLoggedIn()
    //     ? null
    //     : RouteSettings(
    //
    //         name: Routes.login,
    //         arguments: Get.arguments,
    //       );

    return RouteSettings(
      name: Routes.login,
      arguments: Get.arguments,
    );
  }
}
