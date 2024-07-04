import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherDetailsScreen extends StatefulWidget {
  WeatherDetailsScreen(this.weatherdata);
  var weatherdata;
  @override
  _WeatherDetailsScreenState createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  @override
  WeatherModel object = WeatherModel();
  int temperature = 0;
  String? weathericon;
  String? cityname;
  String? message;
  String? newcityname;
  String? weatherDescription;
  int? humidity;
  double? windSpeed;

  void initState() {
    super.initState();
    updateUI(widget.weatherdata);
  }

  void updateUI(dynamic weatherdata) {
    setState(() {
      if (weatherdata == null) {
        temperature = 0;
        cityname = "";
        weathericon = "";
        message = "unable to get the weather";
        weatherDescription = "Unable to get the weather";
        humidity = 0;
        windSpeed = 0.0;
        return;
      }

      temperature = weatherdata['main']['temp'].toInt();
      var condition = weatherdata['weather'][0]['id'];
      cityname = weatherdata['name'];
      weathericon = weatherdata['weather'][0]['icon'];
      message = object.getMessage(temperature);
      weatherDescription = weatherdata['weather'][0]['main'];
      humidity = weatherdata['main']['humidity'];
      windSpeed = weatherdata['wind']['speed'].toDouble();
    });
  }

  Future<void> refreshWeather() async {
    var weatherdata = await object.getcitylocation(cityname!);
    updateUI(weatherdata);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background-2.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.near_me,
                        size: 43.sp,
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        refreshWeather();
                      },
                      child: Icon(
                        Icons.refresh,
                        size: 43.sp,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        newcityname = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }));

                        if (newcityname != null) {
                          var weatherdata =
                              await object.getcitylocation(newcityname);
                          updateUI(weatherdata);
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 43.sp,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  '$cityname',
                  style: kbigTextStyle,
                ),
                SizedBox(height: 25.h),
                Text(
                  '$temperature°',
                  style: kTempTextStyle,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '$weatherDescription',
                      style: kTempTextStyle,
                    ),
                    SizedBox(width: 20.w),
                    Image.network(
                      scale: 0.8,
                      'https://openweathermap.org/img/w/$weathericon.png',
                    ),
                  ],
                ),
                Text(
                  'Humidity: $humidity%',
                  style: kTempTextStyle,
                ),
                Text(
                  'Windspeed: $windSpeed KpH',
                  style: kTempTextStyle,
                ),
                Spacer(),
                Text(
                  "$message in $cityname!",
                  textAlign: TextAlign.right,
                  style: kTempTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
