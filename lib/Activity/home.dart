import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    //  getData();
    // print("This is a init state");
  }

  @override
  Widget build(BuildContext context) {
    //data retrive karain agy
    var city_name = [
      "Lahore",
      "Karachi",
      "Faislabad",
      "Sahiwal",
      "Multan",
      "London"
    ];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    // jo bhi argument arahy hongai unko get kary ga or info mai store
    Map<dynamic, dynamic>? info =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;

    if (info != null) {
      print(info['air_speed_value']); // Access and print the value safely
    } else {
      print('No data received');
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.blue.shade800,
          )),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  //gradient kaha say shuru hona chahiye
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  //stops > color transition cntrl

                  colors: [Colors.blue.shade800, Colors.blue.shade300])),
          child: Column(
            children: [
              Container(
                //Search Wala Container

                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("Search Me");
                      },
                      child: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.blueAccent,
                        ),
                        margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Search $city"),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        // Image.network("ddv"),
                        Column(
                          children: [
                            Text(
                              "Scatterd Clouds",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "In Faislabad",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white.withOpacity(0.5)),
                          height: 200,
                          margin: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          padding: EdgeInsets.all(26),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                WeatherIcons.thermometer, // Thermometer icon
                                // size: 50, // Adjust the size as needed
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "41",
                                    style: TextStyle(fontSize: 70),
                                  ),
                                  Text("C", style: TextStyle(fontSize: 50))
                                ],
                              ),
                            ],
                          )))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.fromLTRB(23, 0, 10, 0),
                        padding: EdgeInsets.all(20),
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.day_windy),
                              ],
                            ),
                            SizedBox(height: 6),
                            Text(
                              "20.9",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text("km/h"),
                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.fromLTRB(10, 0, 23, 0),
                        padding: EdgeInsets.all(20),
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            SizedBox(height: 6),
                            Text(
                              "60",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text("%"),
                          ],
                        )),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("MADE BY AMNA "),
                    Text("Data Provided By Openweathermap.org"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
