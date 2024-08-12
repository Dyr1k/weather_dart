
class Weather {
  final String lastUpdated;
  final String cityName;
  final double tempC;
  final double feelsLikeC;
  final String condition;

  Weather({required this.lastUpdated, required this.cityName, required this.tempC, required this.feelsLikeC, required this.condition});

  factory Weather.fromJson(Map<String, dynamic> json) {
    final currentData = json['current'];
    final conditionData = currentData['condition'];
    return Weather(lastUpdated: currentData['last_updated'],
    cityName: json['location']['name'],
    tempC: currentData['temp_c'].toDouble(),
    feelsLikeC: currentData['feelslike_c'].toDouble(),
    condition: conditionData['text'],
    );
  }
  @override
  String toString() =>'''
  Last updated: $lastUpdated
  Temperature: $tempC C
  Feels like: $feelsLikeC C
  Weather condition: $condition
    ''';

  
  }

class Forecast {
  final String date;
  final double minTemp;
  final double maxTemp;
  final String condition;

  Forecast({
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.condition,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    final conditionData = json['day']['condition'];
    return Forecast(date: json['day']['date'].toDouble(), minTemp: json['day']['mintemp_c'], maxTemp: json['day']['maxtemp_c'], condition: conditionData['text']);
  }

  @override
  String toString() => '''
  date: $date
  Temperature: $minTemp C - $maxTemp C
  Weather condition: $condition
  ''';
}


