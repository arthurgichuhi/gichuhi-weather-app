import 'dart:convert';
import 'package:gichuhiweather/gichuhi/forecastutil.dart';
import 'package:gichuhiweather/gichuhi/weatherforecastmodel.dart';
import 'package:http/http.dart';

class Network {
  Future<Weatherforecastmodel> getWeatherforecast(String cityName) async {
    var finalUrl = 'http://api.openweathermap.org/data/2.5/weather?q=' +
        cityName +
        '&APPID=' +
        Util.appId;
    final response = await get(Uri.parse(finalUrl));
    if (response.statusCode == 200) {
      print(response.body);
      print('+_________________________+');
      print(Weatherforecastmodel.fromJson(jsonDecode(response.body)));
      print('+_________________________+');
      print(response.body);
      return Weatherforecastmodel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Data Unavailable");
    }
  }
}
