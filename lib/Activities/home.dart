import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import  'package:http/http.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // String username="null";
  //
  // Future getData() async
  // {
  //   await Future.delayed(Duration(seconds: 5),(){
  //     username="Sanidhya";
  //   });
  //
  //   print("Here $username");
  // }
  //
  // void showData() async
  // {
  //   await getData();
  //   print("Jai Shri Krishna $username");
  // }

  //Async :: Functions stert but Return some delayed
  //Future.delayed - Function start after some delayed



  // void timer()
  // {
  //   //This method is used to perform a task after a particular time.
  //   Future.delayed(Duration(seconds: 3),(){
  //     print("Alarm is Ringing, Hari Bol");
  //   });
  //
  //   print("Jai Jai Shri Radhe");
  //
  // }

  TextEditingController searchController = new TextEditingController();



  @override
  void initState() {

    super.initState();

    // timer();

    print("Jai Shri Krishna");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);

    print("Radhe Radhe");
  }

  @override
  Widget build(BuildContext context) {


    var cityNames = ["Indore", "Vrindawan", "Mumbai", "Khandwa", "Delhi"];

    final _random=new Random();
    var city = cityNames[_random.nextInt(cityNames.length)];


    Map info = ModalRoute.of(context)!.settings.arguments as Map;

    String temperature = ((info['temp_value']).toString().substring(0,4));
    String icon=info['icon_value'];
    String cityName=info['city_value'];
    String des=info['desc_value'];
    String hum=info['hum_value'];
    String air=info['airSpd_value'].toString().substring(0,4);

    

    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(0),
      //   child: AppBar(
      //     backgroundColor: Colors.blue,
      //   ),
      // ),
      resizeToAvoidBottomInset: false,
      //appbar with gradient bg
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: NewGradientAppBar(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.lightBlueAccent,

            ],

            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
        ),
      ),

      body: SafeArea(

        child: Container( //Main Container

          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,

              //Gradient colors
              colors: [
                  Colors.blue,
                  Colors.lightBlueAccent
              ]
            )
          ),
          child: Column(
            children: [
              Container(//Search container
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.symmetric(horizontal: 24,vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "/loading",arguments: {"search_text":searchController.text}
                        );

                      },
                      child: Container(child:Icon(Icons.search,color: Colors.lightBlue,),
                        margin: EdgeInsets.fromLTRB(3, 0, 7, 0),),
                    ),
                    Expanded(child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search $city"
                      ),
                    ))

                  ],
                ),
              ),


              //-----------------------------------------------------------

              Row(

                children: [
                  //First wala box
                  Expanded(

                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                       color: Colors.white.withOpacity(0.5)
                    ),
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Image.network("http://openweathermap.org/img/wn/$icon@2x.png"),
                        Column(
                          children: [
                            Text("$des",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            Text("In $cityName",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)


                          ],
                        )

                      ],
                    ),
                  ),
                ),]
              ),

              //--------------------------------------------------------

              //Second wala Box
              
              SingleChildScrollView(
                child: Row(
                  children: [

                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)
                        ),
                        padding: EdgeInsets.all(25),
                        margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$temperature",style: TextStyle(fontSize: 90),),
                                Text("C",style: TextStyle(fontSize: 25),)
                              ],
                            )
                          ],
                        )
                      ),
                    ),
                  ],
                ),
              ),

              //--------------------------------------------------------

              //THIRD    AND     FOURTH       BOX


              Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)
                      ),
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.fromLTRB(20,0,10,0),
                      child: Column(

                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:[
                              Icon(WeatherIcons.day_windy),
                            ]
                          ),

                          SizedBox(height: 5,),
                          Text("$air",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold ),),
                          Text("km/hr")
                        ],
                      )
                    ),
                  ),
                  
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)
                      ),
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.fromLTRB(10,0,20,0),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:[
                                Icon(WeatherIcons.humidity),
                              ]
                          ),
                          SizedBox(height: 5,),
                          Text("$hum",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold ),),
                          Text("Percent")
                        ],
                      ),
                  ),
                  )
                ],
              )


            ],
          ),
        ),
      ),
    );
  }

}
