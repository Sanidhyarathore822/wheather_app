import 'package:flutter/material.dart';

import 'Activities/home.dart';
import 'Activities/loading.dart';
import 'Activities/load.dart';
import 'Activities/location.dart';


void main() {
  runApp(MaterialApp(

    routes:{
      "/":(context)=> Load(),
      "/home":(context)=> Home(),
      "/loading":(context)=>Loading()
    },
  ));





}

