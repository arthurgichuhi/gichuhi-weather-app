import 'package:flutter/material.dart';
import 'package:gichuhiweather/gichuhi/weatherforecastmodel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gichuhiweather/gichuhi/convert_icon.dart';
import 'package:gichuhiweather/gichuhi/forecastutil.dart';

Widget midview(AsyncSnapshot snapshot) {
  var city = snapshot.data.name;
  var country = snapshot.data.sys.country;
  var temp = snapshot.data.main.temp - 273;
  Wind wind = snapshot.data.wind;
  Main main = snapshot.data.main;
  var formattedDate =
      new DateTime.fromMillisecondsSinceEpoch(snapshot.data.dt * 1000);

  List weatherlist = snapshot.data.weather;
  Container mideview = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "$city,$country",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        Text("${Util.getFormatteddate(formattedDate)}"),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: getIcons(weatherlist[0].main, Colors.pinkAccent, 198),
        ),
        // Icon(
        //   FontAwesomeIcons.cloud,
        //   color: Colors.pinkAccent,
        //   size: 195,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              temp.toStringAsFixed(0) + "\u00B0C",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            Text(" ${weatherlist[0].description.toUpperCase()}",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 9))
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${wind.speed!.toStringAsFixed(1)} ml/h"),
                    Icon(
                      FontAwesomeIcons.wind,
                      size: 20,
                      color: Colors.brown,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${main.humidity} %"),
                    Icon(
                      FontAwesomeIcons.solidFaceGrinBeamSweat,
                      size: 20,
                      color: Colors.brown,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${main.tempMax!.toStringAsFixed(1)} \u00b0 F"),
                    Icon(
                      FontAwesomeIcons.temperatureHigh,
                      size: 20,
                      color: Colors.brown,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
  return mideview;
}
