import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/config/themes/light_theme.dart';
import 'package:weather/modules/weather_home/view/weather_home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      title: 'Weather Demo',
      theme: lightTheme(),
      debugShowCheckedModeBanner: false,
      home: const WeatherHomeView(),
    );
  }
}
