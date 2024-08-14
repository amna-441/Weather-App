import 'package:flutter/material.dart';
import 'package:weatherapp/Activity/home.dart';
import 'package:weatherapp/Activity/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Loading(),
    // home: Home(),  ye bhi default hay lekn route ki priority zayada
    routes: {

      //default route bnaya hay jo app kay run hony par hoga
      "/home": (context) => Home(),
    },
  ));
}
