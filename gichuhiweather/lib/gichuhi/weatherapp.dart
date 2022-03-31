import 'package:flutter/material.dart';
import 'package:gichuhiweather/gichuhi/mideview.dart';
import 'package:gichuhiweather/gichuhi/network.dart';
import 'package:gichuhiweather/gichuhi/weatherforecastmodel.dart';

class Weatherforecast extends StatefulWidget {
  Weatherforecast({Key? key}) : super(key: key);

  @override
  _WeatherforecastState createState() => _WeatherforecastState();
}

class _WeatherforecastState extends State<Weatherforecast> {
  late Future<Weatherforecastmodel> forecastobject;

  String _cityname = "Nairobi";
  @override
  void initState() {
    super.initState();
    forecastobject = Network().getWeatherforecast(_cityname);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        textfieldview(),
        Container(
          child: FutureBuilder<Weatherforecastmodel>(
              future: forecastobject,
              builder: (context, AsyncSnapshot<Weatherforecastmodel> snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else if (snapshot.hasData) {
                  return Container(child: midview(snapshot));
                }

                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    return Column(
                      children: [midview(snapshot)],
                    );
                }
              }),
        ),
        // Container(
        //   height: 40,
        //   width: 50,
        //   child: ElevatedButton(
        //       onPressed: () {
        //         print(Network().getWeatherforecast(_cityname));
        //       },
        //       child: Text('test button')),
        // )
      ],
    ));
  }

  Widget textfieldview() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: EdgeInsets.all(8),
            prefixIcon: Icon(Icons.search),
            hintText: "Enter City Name"),
        onSubmitted: (value) {
          setState(() {
            _cityname = value;
            forecastobject = getWeather(_cityname);
          });
        },
      ),
    );
  }

  Future<Weatherforecastmodel> getWeather(String cityname) =>
      new Network().getWeatherforecast(_cityname);
}
