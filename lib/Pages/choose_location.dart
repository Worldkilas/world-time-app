import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Choose a Location'),
        backgroundColor: const Color.fromARGB(255, 4, 67, 118),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: const SafeArea(child: Text('Choose Location')),
    );
  }
}
