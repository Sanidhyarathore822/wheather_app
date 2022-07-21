import 'package:flutter/material.dart';
import 'package:wheather_app/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String temp="";
  String airSpd="";
  String hum="";
  String desc="";
  String main="";
  String icon="";
  String city="Khandwa";


  void startApp() async
  {

    worker instance = worker(location:city);
    await instance.getData();

    temp=instance.temp;
    desc=instance.description;
    main=instance.main;
    airSpd=instance.air_speed;
    hum=instance.humidity;
    icon=instance.icon;
    
    Future.delayed(Duration(seconds: 2),(){Navigator.pushReplacementNamed(context, '/home', arguments: {
      "temp_value":temp,
      "hum_value":hum,
      "airSpd_value":airSpd,
      "desc_value":desc,
      "main_value":main,
      "icon_value":icon,
      "city_value":city
    });});




  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Om Namo Bhagwate Vasudevaye");

    print("task 1234567");


  }


  @override
  Widget build(BuildContext context) {

    print("task 8909");


    try
    {
      Map search = ModalRoute.of(context)?.settings.arguments as Map;
      city = search['searchText'];
      print(city);
      startApp();

    }
    catch(e)
    {
      print("Hari Bol");
      print(city);
      startApp();
    }




    print("task 1234");

    return Scaffold(
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            SizedBox(height: 15,),
            Image.asset("img/logo.png",height: 200,width: 200,),
            Text("\nWeather App",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),),
            SizedBox(height: 10,),
            Text("Made in Bharat", style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.white,),),
            SizedBox(height: 30,),
            SpinKitWave(
              color: Colors.black87,
              size: 60.0,
            ),
          ],
        ),
      ),
          backgroundColor: Colors.blue,
    );
  }
}
