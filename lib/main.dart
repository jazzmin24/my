import 'package:flutter/material.dart';
import 'package:clima/screens/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _permissionStatus = "Unknown";

  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    setState(() {
      if (status.isGranted) {
        _permissionStatus = "Granted";
      } else if (status.isDenied) {
        _permissionStatus = "Denied";
      } else if (status.isPermanentlyDenied) {
        _permissionStatus = "Permanently Denied";
      }
    });

    if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  void initState() {
    _requestLocationPermission();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(400, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: SplashScreen(),
      ),
    );
  }
}
