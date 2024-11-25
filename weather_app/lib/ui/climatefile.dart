import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/apifile.dart' as util;
import 'package:http/http.dart' as http;
import 'dart:convert';

class climate extends StatefulWidget {
  const climate({super.key});

  @override
  State<climate> createState() => _climateState();
}

class _climateState extends State<climate> {
  void showStuff() async {
    Map data = await getWeather(util.apiId, util.defaultCity);
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClimateApp'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => showStuff(),
          )
        ],
      ),
      body: Stack(
        children: [
          Center(
              child: Image(image: AssetImage('images/umbrella.jpeg'),
                height: 1200.0,
                width: 590.0,
                fit: BoxFit.fill,
              )
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
            child: Text(
              'Vehari',
              style: cityStyle(),
            ),
          ),
          Center(
              child: Image(image: AssetImage('images/lightrain.png'),
              )
          ),
          Container(

            margin: EdgeInsets.fromLTRB(30.0, 390.0, 20.9, 0.0),
            child: updateTempWidget('Lahore'),
          ),
        ],
      ),
    );
  }

  Future <Map> getWeather(String appId, String city) async {
    String apiUrl =
        ' https://api.openweathermap.org/data/2.5/weather?q=$city&appid=''${util
        .apiId}&units=imperial';
    http.Response response = await http.get(Uri.parse(apiUrl));
    return json.decode(response.body);
  }

  Widget updateTempWidget(String city) {
    return FutureBuilder(
      future: getWeather(util.apiId, city.isEmpty ? util.defaultCity : city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        if (snapshot.hasData) {
          Map content = snapshot.data!;
          return Container(
            margin: const EdgeInsets.fromLTRB(30.0, 250.0, 0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text(
                    content['main']['temp'].toString() + "F",
                    style: TextStyle(
                      fontSize: 49.9,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    "Humidity: ${content['main']['humidity'].toString()}\n"
                        "Min: ${content['main']['temp_min'].toString()}F\n"
                        "Max: ${content['main']['temp_max'].toString()}F\n",
                    style: extraData(),
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text(
            'Error loading weather data',
            style: TextStyle(color: Colors.red),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

TextStyle cityStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic,
  );
}
TextStyle tempStyle(){
  return TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 49.9
  );
}
TextStyle extraData() {
  return new TextStyle(
      color: Colors.white70, fontStyle: FontStyle.normal, fontSize: 17.0);
}
