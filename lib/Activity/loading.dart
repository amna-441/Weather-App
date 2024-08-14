import 'package:flutter/material.dart';
import 'package:weatherapp/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String temp = '';
  String hum = '';
  String airs = '';
  String des = '';
  String main = '';

  void startapp() async {
    Worker instance = Worker(location: "lahore");
    await instance.getData();
    // print(instance.temp);
    //values assign
    temp = instance.temp;
    hum = instance.humidity;
    airs = instance.airspeed;
    des = instance.description;
    main = instance.main;
    // throw to home page
    //loading page say home par pass karain gay
    //  argument mai map pass karwaty hain
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "air_speed_value": airs,
        "des_value": des,
        "main_value": main,
      });
    });
  }

  @override
  void initState() {
    startapp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   "mlogo.png",
            //   height: 240,
            //   width: 240,
            // ),
            Text(
              "Weather App",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "CONNECT WITH US",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            // spinkit kay agy uska nam laga do
            SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
