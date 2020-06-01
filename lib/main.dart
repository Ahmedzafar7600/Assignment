import 'dart:async';
import 'package:animated_splash/animated_splash.dart';
import 'package:assignment/screens/DetailViewScreen.dart';
import 'package:assignment/screens/HomeViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:feature_discovery/feature_discovery.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Assignment',
        debugShowCheckedModeBanner: false,
        routes: {
          '/detail': (context) => DetailViewScreen(),
        },
        theme: ThemeData(
            primaryColor: Colors.white,
            textTheme: TextTheme(title: TextStyle(color: Colors.black)),
            cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            )),
        home: AnimatedSplash(
          imagePath: 'assets/image.png',
          home: FeatureDiscovery(child: HomeViewScreen()),
          duration: 2500,
          type: AnimatedSplashType.StaticDuration,
        ));
  }
}
