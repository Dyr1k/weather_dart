import 'package:weather_dart/weather_api_client.dart';
import 'dart:io';


Future<void> main(List<String> arguments) async{
  if (arguments.length != 1) {
    print('Syntaxix error: dart bin/main.dart <city>');
    return;
  }

  final cityName = arguments.first;
  //print(cityName);
  final weatherApiClient = WeatherApiClient();

  try {
    final currentWeather = await weatherApiClient.getCurrentWeather(cityName);
    print('Current Weather for $cityName');
    print(currentWeather);
    print('-------------------\n');
  }on WeatherApiException catch (error) {
    print('Error: ${error.message}');
  } on SocketException catch(_) {
    print('Check your internet connection');
  } catch (e) {
    print(e);
  }
}
