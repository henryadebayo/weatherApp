import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
const apikey = '961580f6ec754cb00a3060c367618c7b';


class LoadingScreen extends StatefulWidget {


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double longitude;
  double latitude;
@override

  void initState()async{
  super.initState();
  getLocation();
  }

 void getLocation() async{
  Location location = Location();
  await location.getCurrentLocation();
longitude = location.longitude;
latitude = location.latitude;

getData();

 }
 void getData() async{


  http.Response response = await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey');

 if (response.statusCode == 200) {

   String data = response.body;

   var decodedData = jsonDecode(data);

   var temp = decodedData["main"]['temp'];
   var condition =  decodedData['weather'][0]['id'];
   var countryNme = decodedData['name'];

 }else{
   print (response.statusCode);
 }
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
         Text('position'),
          Text('$getLocation().response.statusCode'),
        ],
      ),
    );
  }
}
