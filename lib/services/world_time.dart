import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; // location name for the UI
  String? time; // timein that location
  String flag; // url to an asset flag icon
  String locationUrl; // location url for api endpoint
  WorldTime(
      {required this.location, required this.flag, required this.locationUrl});

  Future<void> getTime() async {
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
    time = now.toString();
  }
}
