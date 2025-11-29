import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //api key
  final _weatherService = WeatherService(
    apiKey: "6f576b96cea71c8c8a54836d1a17bbcb",
  );

  Weather? _weather;
  //fetch weather
  _featchWeather() async {
    //get current city
    String cityName = await _weatherService.getCurrentCity();

    //get weather for the city

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }
  //weather animation

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) {
      return 'assets/Weather-sunny.json';
    }
    // default to sunny

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'fog':
        return 'assets/Weather-cloudy.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/Weather-rain.json';
      case 'thunderstorm':
        return 'assets/Weather-storm.json';

      case 'clear':
        return 'assets/Weather-sunny.json';
      default:
        return 'assets/Weather-sunny.json';
    }
  }

  //init state
  @override
  void initState() {
    super.initState();

    //ftech weather on startup
    _featchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            //city name
            Text(
              _weather?.cityName ?? "Loading...",
              style: TextStyle(fontSize: 50),
            ),

            //animation
            Lottie.asset(
              getWeatherAnimation(_weather?.mainCondition),
              height: 200,
              width: 200,
              fit: BoxFit.fill,
            ),

            //tenperature
            Text(
              '${_weather?.temperature.round()} °C',

              style: TextStyle(fontSize: 22),
            ),
            //weather condition
            Text(_weather?.mainCondition ?? "", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
