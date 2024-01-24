// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> setupWorldtime() async {
    /* Used a Completer to handle the navigation after the
    asynchronous function is comleted */
    Completer<void> completer = Completer<void>();
    WorldTime instance =
        WorldTime(location: 'Lagos', flag: '', locationUrl: 'Africa/Lagos');
    await instance.getTime();
    completer.future.then((_) {
      // used the argument property to pass values from  one route to another
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime
      });
    });
    completer.complete();
  }

  @override
  void initState() {
    super.initState();
    setupWorldtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: const Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
