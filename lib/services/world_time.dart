import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String? time; // timein that location
  String flag; // url to an asset flag icon
  String locationUrl; // location url for api endpoint
  bool isDaytime = true;

  WorldTime(
      {required this.location, required this.flag, required this.locationUrl});
  Future<void> getTime() async {
    try {
      //make the request
      Uri worldTimeUrl =
          Uri.parse('http://worldtimeapi.org/api/timezone/$locationUrl');
      Response response = await get(worldTimeUrl);
      Map data = jsonDecode(response.body);

      // print(data);
      // get properties from data
      String dateTime = data['datetime'];
      String? offset = data['utc_offset'].substring(1, 3);
      // print(dateTime);
      // print(offset);
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset!)));
      //set the time property
      isDaytime = now.hour > 7 && now.hour < 19 ? isDaytime : !isDaytime;
      time = DateFormat.jm().format(now);
    } catch (e) {
      // ignore: avoid_print

      time = 'Could not get time';
    }
  }
}
