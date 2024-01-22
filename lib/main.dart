import 'package:flutter/material.dart';
import 'package:world_time_app/Pages/choose_location.dart';
import 'package:world_time_app/Pages/home.dart';
import 'package:world_time_app/Pages/loading.dart';

// ignore: prefer_const_constructors
void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const ChooseLocation()
      },
    ));
