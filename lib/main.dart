import 'package:flutter/material.dart';

import 'Activities/home.dart';
import 'Activities/loading.dart';
import 'Activities/location.dart';


void main() {
  runApp(MaterialApp(

    routes:{
      "/":(context)=> Loading(),
      "/home":(context)=> Home(),
      "/loading":(context)=>Loading()
    },
  ));





}

