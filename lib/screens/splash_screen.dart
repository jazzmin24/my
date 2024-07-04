import 'package:clima/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getlocation();
  }

  void getlocation() async {
    WeatherModel object = WeatherModel();
    var weather = await object.getlocation();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherDetailsScreen(weather);
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Let\'s predict the weather!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
        )),
      ),
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.sp,
        ),
      ),
    );
  }
}
