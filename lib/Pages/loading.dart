import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: Container(
          constraints: const BoxConstraints(maxHeight: 300, maxWidth: 300),
          decoration: BoxDecoration(
              color: Colors.purple, borderRadius: BorderRadius.circular(10)),
          child: const RotatedBox(quarterTurns: 3, child: Text('Loading')),
        ),
      )),
    );
  }
}
