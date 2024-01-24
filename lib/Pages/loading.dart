// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String showTime = 'loading ';
  Future<void> setupWorldtime() async {
    WorldTime instance =
        WorldTime(location: 'Berlin', flag: '', locationUrl: 'Africa/Lagos');
    await instance.getTime();
    setState(() {
      showTime = instance.time!;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Text(
            showTime,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
