import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const openweathermapurl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getcitylocation(String? cityname) async {
    var url =
        '$openweathermapurl?q=$cityname&appid=eb33257a1a57cdb686cf4595e65c5bbf&units=metric';
    NetworkHelper object = await NetworkHelper(url);
    var weatherdata = object.getdata();
    return weatherdata;
  }

  Future<dynamic> getlocation() async {
    Location location = Location();
    await location.getlocation();

    String url =
        '$openweathermapurl?lat=${location.latitude}&lon=${location.longitude}&appid=eb33257a1a57cdb686cf4595e65c5bbf&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weather = await networkHelper.getdata();
    print(weather);
    return weather;
  }


  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
