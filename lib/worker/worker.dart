import 'package:http/http.dart';
import 'dart:convert';

class Worker {
  String location;

  // Constructor
  Worker({required this.location});

  String temp = '';
  String humidity = '';
  String airspeed = '';
  String description = '';
  String main = '';

  // Method to get data based on location
  Future<void> getData() async {
    try {
      // Making the API call
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=de84a8cb313ad0f06da41c23e108bb40"));

      if (response.statusCode == 200) {
        // Decoding the JSON response
        Map<String, dynamic> data = jsonDecode(response.body);
        // print(data);
        // Safely extracting the temperature
        Map<String, dynamic> tempData = data['main'];
        double getTemp =
            tempData['temp'] - 273.15; // Convert from Kelvin to Celsius

        // Extracting description and main weather data
        List<dynamic> weatherData = data['weather'];
        Map<String, dynamic> weatherMainData = weatherData[0];
        String getMainDes = weatherMainData['main'];
        String getDesc = weatherMainData['description'];

        // Extracting wind speed
        Map<String, dynamic> windData = data['wind'];
        //convert speed ms-1 to km/h
        double getSpeed = windData['speed'] * 3.6;

        // Extracting humidity
        String getHumidity = tempData['humidity'].toString(); // %

        // Assigning values to instance variables
        temp = getTemp.toStringAsFixed(2); // Keep two decimal places
        humidity = getHumidity;
        airspeed = getSpeed.toStringAsFixed(2); // Keep two decimal places
        description = getDesc;
        main = getMainDes;
      } else {
        print('Failed to load weather data');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
