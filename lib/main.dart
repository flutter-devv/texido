import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'constants/app_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Texido App',
      defaultTransition: Transition.cupertino,
      getPages: getPages(),
      initialRoute: '/',
      themeMode: ThemeMode.system,
      popGesture: true,
    );
  }
}
