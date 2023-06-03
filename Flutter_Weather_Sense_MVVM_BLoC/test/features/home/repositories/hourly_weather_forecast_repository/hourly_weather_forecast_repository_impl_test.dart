import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_sense_mvvm_bloc/core/core_barrel.dart';
import 'package:flutter_weather_sense_mvvm_bloc/features/home/data_sources/hourly_weather_forecast_remote_data_source_barrel.dart';
import 'package:flutter_weather_sense_mvvm_bloc/features/home/models/hourly_weather_forecast_model_barrel.dart';
import 'package:flutter_weather_sense_mvvm_bloc/features/home/repositories/hourly_weather_forecast_repository_barrel.dart';
import 'package:mocktail/mocktail.dart';

class MockIHourlyWeatherForecastRemoteDataSource extends Mock
    implements IHourlyWeatherForecastRemoteDataSource {}

void main() async {
  late MockIHourlyWeatherForecastRemoteDataSource
      iHourlyWeatherForecastRemoteDataSource;
  late HourlyWeatherForecastRepositoryImpl hourlyWeatherForecastRepositoryImpl;

  setUp(() {
    iHourlyWeatherForecastRemoteDataSource =
        MockIHourlyWeatherForecastRemoteDataSource();
    hourlyWeatherForecastRepositoryImpl = HourlyWeatherForecastRepositoryImpl(
      remoteDataSource: iHourlyWeatherForecastRemoteDataSource,
    );
  });

  String buildJsonResults() {
    const rawJsonResults = '''
    {"latitude":52.52,"longitude":13.419998,"generationtime_ms":2.3289918899536133,"utc_offset_seconds":7200,"timezone":"Europe/Berlin","timezone_abbreviation":"CEST","elevation":38.0,"current_weather":{"temperature":26.9,"windspeed":17.6,"winddirection":91.0,"weathercode":3,"is_day":1,"time":"2023-05-21T17:00"},"hourly_units":{"time":"iso8601","temperature_2m":"°C","relativehumidity_2m":"%","dewpoint_2m":"°C","apparent_temperature":"°C","precipitation_probability":"%","weathercode":"wmo code","surface_pressure":"hPa","visibility":"m","windspeed_10m":"km/h"},"hourly":{"time":["2023-05-21T00:00","2023-05-21T01:00","2023-05-21T02:00","2023-05-21T03:00","2023-05-21T04:00","2023-05-21T05:00","2023-05-21T06:00","2023-05-21T07:00","2023-05-21T08:00","2023-05-21T09:00","2023-05-21T10:00","2023-05-21T11:00","2023-05-21T12:00","2023-05-21T13:00","2023-05-21T14:00","2023-05-21T15:00","2023-05-21T16:00","2023-05-21T17:00","2023-05-21T18:00","2023-05-21T19:00","2023-05-21T20:00","2023-05-21T21:00","2023-05-21T22:00","2023-05-21T23:00","2023-05-22T00:00","2023-05-22T01:00","2023-05-22T02:00","2023-05-22T03:00","2023-05-22T04:00","2023-05-22T05:00","2023-05-22T06:00","2023-05-22T07:00","2023-05-22T08:00","2023-05-22T09:00","2023-05-22T10:00","2023-05-22T11:00","2023-05-22T12:00","2023-05-22T13:00","2023-05-22T14:00","2023-05-22T15:00","2023-05-22T16:00","2023-05-22T17:00","2023-05-22T18:00","2023-05-22T19:00","2023-05-22T20:00","2023-05-22T21:00","2023-05-22T22:00","2023-05-22T23:00","2023-05-23T00:00","2023-05-23T01:00","2023-05-23T02:00","2023-05-23T03:00","2023-05-23T04:00","2023-05-23T05:00","2023-05-23T06:00","2023-05-23T07:00","2023-05-23T08:00","2023-05-23T09:00","2023-05-23T10:00","2023-05-23T11:00","2023-05-23T12:00","2023-05-23T13:00","2023-05-23T14:00","2023-05-23T15:00","2023-05-23T16:00","2023-05-23T17:00","2023-05-23T18:00","2023-05-23T19:00","2023-05-23T20:00","2023-05-23T21:00","2023-05-23T22:00","2023-05-23T23:00","2023-05-24T00:00","2023-05-24T01:00","2023-05-24T02:00","2023-05-24T03:00","2023-05-24T04:00","2023-05-24T05:00","2023-05-24T06:00","2023-05-24T07:00","2023-05-24T08:00","2023-05-24T09:00","2023-05-24T10:00","2023-05-24T11:00","2023-05-24T12:00","2023-05-24T13:00","2023-05-24T14:00","2023-05-24T15:00","2023-05-24T16:00","2023-05-24T17:00","2023-05-24T18:00","2023-05-24T19:00","2023-05-24T20:00","2023-05-24T21:00","2023-05-24T22:00","2023-05-24T23:00","2023-05-25T00:00","2023-05-25T01:00","2023-05-25T02:00","2023-05-25T03:00","2023-05-25T04:00","2023-05-25T05:00","2023-05-25T06:00","2023-05-25T07:00","2023-05-25T08:00","2023-05-25T09:00","2023-05-25T10:00","2023-05-25T11:00","2023-05-25T12:00","2023-05-25T13:00","2023-05-25T14:00","2023-05-25T15:00","2023-05-25T16:00","2023-05-25T17:00","2023-05-25T18:00","2023-05-25T19:00","2023-05-25T20:00","2023-05-25T21:00","2023-05-25T22:00","2023-05-25T23:00","2023-05-26T00:00","2023-05-26T01:00","2023-05-26T02:00","2023-05-26T03:00","2023-05-26T04:00","2023-05-26T05:00","2023-05-26T06:00","2023-05-26T07:00","2023-05-26T08:00","2023-05-26T09:00","2023-05-26T10:00","2023-05-26T11:00","2023-05-26T12:00","2023-05-26T13:00","2023-05-26T14:00","2023-05-26T15:00","2023-05-26T16:00","2023-05-26T17:00","2023-05-26T18:00","2023-05-26T19:00","2023-05-26T20:00","2023-05-26T21:00","2023-05-26T22:00","2023-05-26T23:00","2023-05-27T00:00","2023-05-27T01:00","2023-05-27T02:00","2023-05-27T03:00","2023-05-27T04:00","2023-05-27T05:00","2023-05-27T06:00","2023-05-27T07:00","2023-05-27T08:00","2023-05-27T09:00","2023-05-27T10:00","2023-05-27T11:00","2023-05-27T12:00","2023-05-27T13:00","2023-05-27T14:00","2023-05-27T15:00","2023-05-27T16:00","2023-05-27T17:00","2023-05-27T18:00","2023-05-27T19:00","2023-05-27T20:00","2023-05-27T21:00","2023-05-27T22:00","2023-05-27T23:00"],"temperature_2m":[16.2,15.8,15.2,14.7,14.4,13.9,13.8,14.5,16.2,18.1,20.3,22.6,24.4,25.5,26.8,26.7,27.0,26.9,26.5,25.8,24.6,22.9,21.3,20.1,19.0,18.3,17.6,16.8,16.2,15.4,15.0,15.5,16.9,18.8,21.0,23.0,24.6,25.4,25.9,26.1,26.3,25.7,25.5,24.5,23.4,21.8,20.1,18.8,17.6,16.7,16.0,15.4,15.2,14.8,14.6,14.3,14.7,15.7,17.0,18.8,19.3,16.7,17.4,18.9,17.8,17.1,16.4,16.0,15.4,14.9,14.3,13.4,12.7,11.9,11.4,10.7,10.2,10.1,10.3,10.4,10.8,11.7,12.9,14.4,15.7,16.6,17.4,18.0,18.5,18.8,18.7,18.4,17.7,16.6,15.2,13.9,13.1,12.4,11.9,11.3,10.7,10.6,10.9,11.6,12.6,14.2,16.1,17.8,18.9,19.8,20.5,21.0,21.4,21.4,21.2,20.7,19.8,18.5,16.9,15.4,14.2,13.2,12.3,11.5,10.7,10.3,10.3,10.7,10.9,11.3,12.8,14.3,15.5,16.6,17.5,18.1,18.6,18.6,18.2,17.4,16.4,15.3,14.0,12.9,12.1,11.5,10.9,10.2,9.7,9.5,9.8,10.6,11.6,13.0,14.6,16.1,17.3,18.4,19.2,19.8,20.2,20.4,20.2,19.8,19.1,18.0,16.6,15.4],"relativehumidity_2m":[73,75,81,83,85,87,89,86,81,74,68,58,50,44,39,38,33,32,33,34,38,45,48,49,51,55,56,56,57,59,62,62,59,56,51,47,39,32,26,23,21,25,27,29,30,37,42,46,49,52,55,58,59,62,64,69,72,70,66,59,64,77,69,67,70,71,67,68,66,68,67,65,67,70,70,72,75,76,80,66,64,61,58,53,50,46,44,42,40,39,40,43,47,55,64,72,76,79,81,83,85,85,83,80,75,69,61,54,49,44,41,39,38,39,42,47,50,50,48,48,53,60,66,71,75,77,74,69,65,66,61,56,53,50,47,44,41,39,40,42,46,52,58,64,67,69,70,71,72,72,70,66,62,57,50,45,41,39,37,36,36,37,37,38,41,47,55,61],"dewpoint_2m":[11.4,11.4,12.0,11.9,11.9,11.8,12.0,12.2,12.9,13.4,14.2,13.9,13.3,12.4,11.7,11.2,9.4,8.8,8.9,8.7,9.3,10.3,9.9,9.1,8.7,9.1,8.7,8.0,7.7,7.5,7.8,8.2,8.8,9.8,10.5,11.1,9.8,7.5,4.9,3.4,2.3,4.2,5.2,5.3,4.9,6.5,6.8,6.9,6.8,6.8,7.0,7.2,7.2,7.6,7.9,8.7,9.7,10.3,10.6,10.7,12.3,12.6,11.6,12.6,12.3,11.8,10.3,10.1,9.1,9.0,8.2,7.0,6.7,6.6,6.1,5.9,6.0,6.0,7.0,4.4,4.3,4.4,4.8,5.0,5.3,5.0,5.0,4.9,4.7,4.5,4.9,5.6,6.3,7.5,8.4,9.0,9.0,8.9,8.7,8.5,8.3,8.2,8.1,8.3,8.3,8.6,8.6,8.4,8.0,7.2,6.8,6.6,6.5,6.9,7.8,9.0,9.1,7.9,5.8,4.4,4.8,5.6,6.2,6.4,6.5,6.4,5.9,5.2,4.6,5.2,5.5,5.6,5.9,6.1,6.0,5.7,5.1,4.4,4.3,4.3,4.8,5.5,5.9,6.3,6.2,6.0,5.6,5.2,4.9,4.7,4.6,4.5,4.6,4.6,4.3,4.1,3.9,4.2,4.2,4.3,4.7,5.2,5.1,5.0,5.5,6.5,7.5,7.9],"apparent_temperature":[15.2,14.6,14.2,13.9,13.6,13.2,13.0,13.8,15.8,17.7,19.9,22.2,24.2,24.3,25.8,24.6,24.3,24.0,23.5,22.8,22.4,21.2,19.5,18.2,17.1,16.5,15.8,14.9,14.1,13.3,13.1,13.5,15.0,17.0,19.5,22.3,23.6,24.0,24.0,23.8,23.4,22.5,22.2,21.3,20.4,19.4,17.9,16.7,15.6,14.6,14.0,13.4,13.5,13.6,13.5,12.8,13.9,15.2,16.3,17.8,17.7,14.9,15.6,17.4,16.4,15.7,14.5,14.0,13.4,12.9,12.0,11.0,10.3,9.6,9.1,8.6,8.4,8.6,8.8,7.9,8.2,9.1,10.5,12.1,13.4,14.3,15.2,15.8,16.2,16.5,16.6,16.4,15.9,15.1,14.0,13.0,12.1,11.5,10.9,10.3,9.8,9.6,9.9,10.6,11.6,13.1,14.7,16.9,18.1,18.6,18.9,19.1,19.0,19.2,19.1,18.9,18.1,16.6,14.5,12.9,11.9,11.2,10.4,9.6,8.8,8.3,8.1,8.2,8.2,8.8,10.3,12.5,14.2,15.3,16.2,16.6,16.5,15.8,15.2,14.4,13.7,12.9,11.9,11.2,10.5,9.9,9.2,8.5,7.9,7.7,8.0,8.7,9.6,10.9,12.5,14.7,16.4,17.8,18.7,19.1,19.0,18.6,18.0,17.4,16.9,16.1,15.1,14.2],"precipitation_probability":[0,0,0,19,39,58,39,19,0,0,0,0,8,15,23,30,38,45,39,32,26,18,11,3,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,7,10,13,16,19,31,43,55,57,59,61,57,52,48,44,39,35,34,33,32,28,23,19,19,19,19,19,19,19,18,17,16,13,9,6,5,4,3,5,8,10,15,21,26,23,19,16,11,5,0,1,2,3,3,3,3,3,3,3,3,3,3,6,10,13,11,8,6,5,4,3,3,3,3,2,1,0,0,0,0,0,0,0,0,0,0,4,9,13,12,11,10,8,5,3,2,1,0,0,0,0,0,0,0,0,0,0,1,2,3,4,5,6,5,4,3,3,3,3,3,3,3],"weathercode":[2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,3,3,3,3,3,3,3,1,3,3,2,2,3,3,2,1,1,1,1,3,1,3,1,2,3,3,3,3,1,3,3,3,3,3,3,3,61,3,3,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,3,3,3,2,2,2,2,3,3,3,2,3,3,3,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,3,3,3,3,3,3,2,2,2,1,1,1,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0],"surface_pressure":[1016.3,1016.0,1015.9,1015.3,1015.1,1015.2,1014.8,1014.9,1014.6,1014.8,1014.8,1014.3,1014.5,1014.2,1013.6,1013.6,1013.1,1012.8,1012.9,1012.8,1013.0,1013.2,1013.5,1013.9,1014.0,1014.0,1014.0,1013.8,1013.5,1013.1,1012.9,1013.0,1013.3,1013.3,1013.1,1012.9,1012.3,1011.8,1011.3,1010.9,1010.3,1009.8,1009.2,1009.1,1009.2,1009.3,1008.9,1008.8,1008.7,1008.3,1007.8,1007.1,1006.9,1006.9,1006.9,1006.3,1006.8,1006.9,1007.0,1007.0,1007.1,1007.9,1008.1,1006.6,1007.1,1007.6,1008.1,1008.6,1009.3,1010.0,1010.6,1011.1,1011.4,1011.5,1011.6,1012.0,1012.3,1012.5,1012.9,1013.2,1013.6,1013.8,1014.1,1014.2,1014.3,1014.3,1014.5,1014.4,1014.3,1014.3,1014.4,1014.6,1015.0,1015.5,1016.3,1016.9,1017.3,1017.5,1017.7,1017.8,1017.9,1018.1,1018.4,1018.9,1019.3,1019.5,1019.7,1019.7,1019.6,1019.3,1019.0,1018.6,1018.3,1018.0,1017.9,1017.9,1018.0,1018.4,1018.8,1019.2,1019.5,1019.7,1019.9,1019.8,1019.8,1019.9,1020.2,1020.6,1020.9,1023.8,1023.8,1023.9,1023.9,1023.9,1023.8,1023.6,1023.3,1023.2,1023.2,1023.4,1023.6,1023.9,1024.2,1024.4,1024.7,1024.9,1025.1,1025.1,1024.9,1024.8,1024.9,1025.0,1025.0,1024.8,1024.7,1024.3,1023.8,1023.3,1022.8,1022.1,1021.4,1020.8,1020.3,1020.0,1019.7,1019.4,1019.3,1019.2],"visibility":[24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,17100.00,7080.00,6160.00,22660.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,21740.00,24140.00,24140.00,24140.00,17560.00,22000.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,22140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,23200.00,21960.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00,24140.00],"windspeed_10m":[10.5,10.8,11.2,10.1,9.7,9.0,9.7,9.5,9.4,10.8,12.6,14.1,15.6,18.7,17.5,17.3,17.5,17.6,18.4,18.0,13.7,12.6,12.3,11.9,11.2,11.2,9.7,9.4,10.1,10.1,9.7,10.4,11.2,11.9,12.0,12.4,15.3,15.4,15.4,14.8,14.4,14.1,14.8,14.2,12.3,10.5,9.9,9.3,8.3,9.0,8.0,8.8,6.5,3.9,4.5,8.4,5.3,4.1,6.5,8.6,16.0,17.8,15.8,15.6,14.8,13.9,14.2,14.2,12.6,12.1,12.9,11.3,10.5,9.9,8.8,7.8,5.6,3.4,4.8,8.4,8.7,8.5,8.0,8.2,9.6,8.8,7.5,7.3,7.1,6.6,5.8,5.9,6.3,6.1,5.4,4.8,4.8,4.6,4.3,4.1,3.6,3.4,3.4,3.7,4.3,5.4,7.2,8.4,9.3,10.2,10.6,10.6,10.4,10.2,10.2,10.1,10.1,9.8,9.0,8.2,7.6,6.8,6.4,6.6,6.9,7.5,8.2,9.2,9.7,9.2,9.4,9.7,10.0,11.0,11.4,11.6,11.9,11.6,11.2,10.8,10.1,8.7,7.3,5.6,4.5,4.1,3.7,3.5,3.4,3.4,3.8,4.5,4.7,5.0,5.2,5.8,6.0,6.4,6.4,6.6,6.8,7.1,7.1,7.6,7.3,6.5,5.4,4.6]}}
    ''';
    return rawJsonResults;
  }

  HourlyWeatherForecastModel buildHourlyWeatherForecastModel() {
    return HourlyWeatherForecastModel.fromJson(
      json.decode(buildJsonResults()) as Map<String, dynamic>,
    );
  }

  double buildLatitudeCoordinate() => 52.52;

  double buildLongitudeCoordinate() => 13.419998;

  setUpAll(() {
    registerFallbackValue(
      buildHourlyWeatherForecastModel(),
    );
  });

  group('Test the implementation class HourlyWeatherForecastRepositoryImpl',
      () {
    test(
        'Given the instance of HourlyWeatherForecastRepositoryImpl, '
        'When the required instance of MockIHourlyWeatherForecastRemoteDataSource was accessed, '
        'Then it should verify the interaction of its instance.', () async {
      // ARRANGE

      // ACT
      final results =
          await hourlyWeatherForecastRepositoryImpl.findHourlyWeatherForecast(
        latitude: buildLatitudeCoordinate(),
        longitude: buildLongitudeCoordinate(),
      );

      // ASSERT
      verify(
        () => iHourlyWeatherForecastRemoteDataSource.getHourlyWeatherForecast(
          latitude: any(named: 'latitude', that: isA<double>()),
          longitude: any(named: 'longitude', that: isA<double>()),
        ),
      );
    });

    test(
        'Given the instance of HourlyWeatherForecastRepositoryImpl, '
        'When the method of findHourlyWeatherForecast was accessed '
        'with the valid input parameters, '
        'Then it should return the Future of HourlyWeatherForecastModel object',
        () async {
      // ARRANGE
      when(
        () => iHourlyWeatherForecastRemoteDataSource.getHourlyWeatherForecast(
          latitude: any(named: 'latitude', that: isA<double>()),
          longitude: any(named: 'longitude', that: isA<double>()),
        ),
      ).thenAnswer(
        (_) => Future<HourlyWeatherForecastModel>.value(
          buildHourlyWeatherForecastModel(),
        ),
      );

      // ACT
      final results =
          await hourlyWeatherForecastRepositoryImpl.findHourlyWeatherForecast(
        latitude: buildLatitudeCoordinate(),
        longitude: buildLongitudeCoordinate(),
      );

      // ASSERT
      expect(results, isA<Right<Failure, HourlyWeatherForecastModel>>());
      expect(results, equals(Right(buildHourlyWeatherForecastModel())));
      verify(
        () => iHourlyWeatherForecastRemoteDataSource.getHourlyWeatherForecast(
          latitude: any(named: 'latitude', that: isA<double>()),
          longitude: any(named: 'longitude', that: isA<double>()),
        ),
      );
    });

    test(
        'Given the instance of HourlyWeatherForecastRepositoryImpl, '
        'When the method of findHourlyWeatherForecast was accessed '
        'with the valid input parameters, '
        'Then it should throw the ServerException '
        'if the operation results was failed because of Internet Connection.',
        () async {
      // ARRANGE
      when(
        () => iHourlyWeatherForecastRemoteDataSource.getHourlyWeatherForecast(
          latitude: any(named: 'latitude', that: isA<double>()),
          longitude: any(named: 'longitude', that: isA<double>()),
        ),
      ).thenThrow(const ServerException());

      // ACT
      final results =
          await hourlyWeatherForecastRepositoryImpl.findHourlyWeatherForecast(
        latitude: buildLatitudeCoordinate(),
        longitude: buildLongitudeCoordinate(),
      );

      // ASSERT
      expect(results, isA<Left<Failure, HourlyWeatherForecastModel>>());
      expect(results, equals(Left(ServerFailure())));
      verify(
        () => iHourlyWeatherForecastRemoteDataSource.getHourlyWeatherForecast(
          latitude: any(named: 'latitude', that: isA<double>()),
          longitude: any(named: 'longitude', that: isA<double>()),
        ),
      );
    });

    test(
        'Given the instance of HourlyWeatherForecastRepositoryImpl, '
        'When the method of findHourlyWeatherForecast was accessed '
        'with the valid input parameters, '
        'Then it should throw the UnexpectedException '
        'if the operation results was failed because of unknown error.',
        () async {
      // ARRANGE
      when(
        () => iHourlyWeatherForecastRemoteDataSource.getHourlyWeatherForecast(
          latitude: any(named: 'latitude', that: isA<double>()),
          longitude: any(named: 'longitude', that: isA<double>()),
        ),
      ).thenThrow(const UnexpectedException());

      // ACT
      final results =
          await hourlyWeatherForecastRepositoryImpl.findHourlyWeatherForecast(
        latitude: buildLatitudeCoordinate(),
        longitude: buildLongitudeCoordinate(),
      );

      // ASSERT
      expect(results, isA<Left<Failure, HourlyWeatherForecastModel>>());
      expect(results, equals(Left(UnexpectedFailure())));
      verify(
        () => iHourlyWeatherForecastRemoteDataSource.getHourlyWeatherForecast(
          latitude: any(named: 'latitude', that: isA<double>()),
          longitude: any(named: 'longitude', that: isA<double>()),
        ),
      );
    });
  });
}