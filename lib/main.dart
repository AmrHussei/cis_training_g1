import 'package:cis_training_g1/app/app.dart';
import 'package:cis_training_g1/app/injector.dart';
import 'package:cis_training_g1/core/functions/cache_app_data.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'core/network/socket/socket_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await cacheAppData();

  /// NOTIFICATIONS
  // await FirebaseNotifications.initialize();
  // await LocalNotificationService.initialize();

  /// SOCKET IO INIT
  await SocketService().initialize();

  runApp(DevicePreview(
    enabled: false,
    builder: (context) => MyApp(),
  ));
}
