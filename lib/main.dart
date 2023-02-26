import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          // PointerDeviceKind.stylus,
          // PointerDeviceKind.unknown
        },
      ),
      initialRoute: AppPages.INITIAL,
      theme: ThemeData.dark(),
      getPages: AppPages.routes,
    ),
  );
}
