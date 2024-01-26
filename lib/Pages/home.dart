import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    //set background
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/$bgImage'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDaytime': result['isDaytime'],
                      'flag': result['flag']
                    };
                  });
                },
                icon: const Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 110, 245, 204),
                ),
                label: const Text(
                  'Edit Location',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 61, 239, 186),
                      letterSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Color.fromARGB(255, 61, 239, 186)),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                data['time'],
                style: const TextStyle(
                    fontSize: 66, color: Color.fromARGB(255, 61, 239, 186)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
