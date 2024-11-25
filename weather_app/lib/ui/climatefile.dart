import 'package:flutter/material.dart';
import '../utils/apifile.dart' as util;
import 'package:http/http.dart' as http;
import 'dart:convert';

class climate extends StatefulWidget {
  const climate({super.key});

  @override
  State<climate> createState() => _climateState();
}

class _climateState extends State<climate> {
  String cityName = util.defaultCity; // Holds the selected city name
  final TextEditingController cityController = TextEditingController(); // For city input

  Future<Map<String, dynamic>> getWeather(String appId, String city) async {
    String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$appId&units=imperial';
    try {
      http.Response response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    }
  }

  Widget updateTempWidget(String city) {
    return FutureBuilder<Map<String, dynamic>>(
      future: getWeather(util.apiId, city),
      builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text(
            'Error loading weather data: ${snapshot.error}',
            style: const TextStyle(color: Colors.red),
          );
        } else if (snapshot.hasData) {
          Map<String, dynamic> content = snapshot.data!;
          return Container(
            margin: const EdgeInsets.fromLTRB(30.0, 50.0, 0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text(
                    '${content['main']['temp']}F',
                    style: const TextStyle(
                      fontSize: 49.9,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    "Humidity: ${content['main']['humidity']}%\n"
                        "Min: ${content['main']['temp_min']}F\n"
                        "Max: ${content['main']['temp_max']}F\n",
                    style: extraData(),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Text(
            'No weather data available',
            style: TextStyle(color: Colors.grey),
          );
        }
      },
    );
  }

  void _searchCity() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to resize when the keyboard opens
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            // Add padding for the keyboard to avoid overlap
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: cityController,
                  decoration: const InputDecoration(
                    labelText: 'Enter City Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (cityController.text.isNotEmpty) {
                      setState(() {
                        cityName = cityController.text;
                      });
                      Navigator.pop(context); // Close the bottom sheet
                    }
                  },
                  child: const Text('Get Weather'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClimateApp'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _searchCity, // Open the search city input
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'images/umbrella.jpeg',
              height: 1200.0,
              width: 590.0,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
            child: Text(
              cityName,
              style: cityStyle(),
            ),
          ),
          Center(
            child: Image.asset('images/lightrain.png'),

          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30.0, 390.0, 20.9, 0.0),
            child: updateTempWidget(cityName),
          ),
        ],
      ),
    );
  }
}

TextStyle cityStyle() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic,
  );
}

TextStyle extraData() {
  return const TextStyle(
    color: Colors.white70,
    fontStyle: FontStyle.normal,
    fontSize: 17.0,
  );
}
