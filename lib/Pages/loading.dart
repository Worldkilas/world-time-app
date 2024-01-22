// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    Response response = await get(url);
    Map data = jsonDecode(response.body);
    // ignore: avoid_print
    print(data);
    print(data['title']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: Text('Loading screen'),
      ),
    );
  }
}
