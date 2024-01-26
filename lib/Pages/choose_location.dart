import 'package:flutter/material.dart';
import 'package:world_time_app/main.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        location: 'London',
        flag: 'lib/assets/_United_Kingdom.png',
        locationUrl: 'Europe/London'),
    WorldTime(
        location: 'Nairobi',
        flag: 'lib/assets/kenya.png',
        locationUrl: 'Africa/Nairobi'),
    WorldTime(
        location: 'Cairo',
        flag: 'lib/assets/egypt.png',
        locationUrl: 'Africa/Cairo'),
    WorldTime(
        location: 'Athens',
        flag: 'lib/assets/Greece.png',
        locationUrl: 'Europe/Athens'),
    WorldTime(
        location: 'Chicago',
        flag: 'lib/assets/United_States.png',
        locationUrl: 'America/Chicago'),
    WorldTime(
        location: 'Lagos',
        flag: 'lib/assets/nigeria.png',
        locationUrl: 'Africa/Lagos'),
    WorldTime(
        location: 'Seoul',
        flag: 'lib/assets/South_Korea.png',
        locationUrl: 'Asia/Seoul'),
    WorldTime(
        location: 'Jakarta',
        flag: 'lib/assets/indonesia.png',
        locationUrl: 'Asia/Jakarta')
  ];

  Future<void> updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // Navigate to home screen
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Choose a Location',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 4, 67, 118),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(locations[index].flag),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
