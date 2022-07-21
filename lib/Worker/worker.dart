import 'dart:convert';

import 'package:http/http.dart';


// class - different, method
//instance - different data,



class worker{

  String location="";

  //Creating constructor for location
  worker({this.location=""}){

  }


  String temp="";
  String humidity="";
  String air_speed="";
  String description="";
  String main="";
  String icon="";


  //methods

  Future<void> getData() async
  {

    try{
      //Get data
      Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=b6a591c47969be33ff586555a6e3f3c7"));
      Map data = jsonDecode(response.body);


      //Getting Temp and Humidity

      Map temp_humid_map = data['main'];
      double temp=temp_humid_map['temp']-273.15;
      String humidity=temp_humid_map['humidity'].toString();


      //Getting Air Speed

      Map wind_map = data['wind'];
      double air_speed = wind_map["speed"] / 0.27777777777778;


      //Getting Description

      List weatherData = data['weather'];
      Map weatherMap = weatherData[0];
      String main_des = weatherMap['main'];
      String desc = weatherMap['description'];





      //Assigning values

      this.temp=temp.toString(); //C
      this.humidity=humidity;  //
      this.air_speed=air_speed.toString();  // km per H
      main=main_des;
      description=desc;
      icon = weatherMap["icon"].toString();



      //Dictionary in List
      // List weatherData = data['weather'];
      // Map weatherMap = weatherData[0];
      // print(weatherMap['description']);


      //Dictionary in Dictionary
      // Map temp_data = data['main'];
      // double temp = temp_data['temp'];
      // print(temp_data);
      // print(temp);


      // print(data);

    }
    catch(e)
    {
      print(e);
      temp="Error Occured";
      description="Error Occured";
      humidity="Can't find data";
      air_speed="Can't find data";
      main="Can't find data";
      icon = "Sorry";
    }


  }




}
