import 'dart:async';

import 'package:boilerplate/ui/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'di/components/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  await setPreferredOrientations();
  await setupLocator();
  return runZonedGuarded(() async {


    runApp(MyApp());
  }, (error, stack) {
    print(stack);
    print(error);
  });
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
