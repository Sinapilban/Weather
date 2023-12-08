import 'package:flutter/material.dart';
import 'package:water/API/API_wather.dart';

class Germany extends StatefulWidget {
  const Germany({Key? key});

  @override
  State<Germany> createState() => _GermanyState();
}

class _GermanyState extends State<Germany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Germany",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(100),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blueGrey[900]!,
                              Colors.blueGrey[900]!,
                              Colors.blueGrey,
                              Colors.blueGrey,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.5, 0.5, 1.0],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FutureBuilder(
                                  future: WeatherApi().fetchWeather('Berlin'),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Padding(
                                        padding: EdgeInsets.only(top: 400),
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else {
                                      final weatherData = snapshot.data;
                                      final currentTemp =
                                          weatherData!['current']['temp_c']
                                              .toString();
                                      final name = weatherData!['location']
                                              ['name']
                                          .toString();
                                      final ostan = weatherData!['location']
                                              ['region']
                                          .toString();
                                      final imageUrl = weatherData!['current']
                                          ['condition']['icon'];
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 160,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors.blueGrey[900]!,
                                                      Colors.blueGrey[900]!,
                                                      Colors.blueGrey,
                                                      Colors.blueGrey,
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    stops: [0.0, 0.5, 0.5, 1.0],
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black,
                                                      offset: Offset(0, 0),
                                                    ),
                                                  ],
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              " State: $ostan",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                              height: 50,
                                                            ),
                                                            Text(
                                                              " City: $name",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.network(
                                                              'https:$imageUrl', // مسیر تصویر
                                                              width:
                                                                  100, // عرض تصویر
                                                              height:
                                                                  80, // ارتفاع تصویر
                                                              fit: BoxFit
                                                                  .cover, // تنظیم نوع تغییر اندازه تصویر
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                              height: 60,
                                                            ),
                                                            Text(
                                                              " whather: $currentTemp",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(100),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blueGrey[900]!,
                              Colors.blueGrey[900]!,
                              Colors.blueGrey,
                              Colors.blueGrey,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.5, 0.5, 1.0],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FutureBuilder(
                                  future: WeatherApi().fetchWeather('Hamburg'),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Padding(
                                        padding: EdgeInsets.only(top: 400),
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else {
                                      final weatherData = snapshot.data;
                                      final currentTemp =
                                          weatherData!['current']['temp_c']
                                              .toString();
                                      final name = weatherData!['location']
                                              ['name']
                                          .toString();
                                      final ostan = weatherData!['location']
                                              ['region']
                                          .toString();
                                      final imageUrl = weatherData!['current']
                                          ['condition']['icon'];
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 160,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors.blueGrey[900]!,
                                                      Colors.blueGrey[900]!,
                                                      Colors.blueGrey,
                                                      Colors.blueGrey,
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    stops: [0.0, 0.5, 0.5, 1.0],
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black,
                                                      offset: Offset(0, 0),
                                                    ),
                                                  ],
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              " State: $ostan",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                              height: 50,
                                                            ),
                                                            Text(
                                                              " City: $name",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.network(
                                                              'https:$imageUrl', // مسیر تصویر
                                                              width:
                                                                  100, // عرض تصویر
                                                              height:
                                                                  80, // ارتفاع تصویر
                                                              fit: BoxFit
                                                                  .cover, // تنظیم نوع تغییر اندازه تصویر
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                              height: 60,
                                                            ),
                                                            Text(
                                                              " whather: $currentTemp",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(100),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blueGrey[900]!,
                              Colors.blueGrey[900]!,
                              Colors.blueGrey,
                              Colors.blueGrey,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.5, 0.5, 1.0],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FutureBuilder(
                                  future: WeatherApi().fetchWeather('munich'),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Padding(
                                        padding: EdgeInsets.only(top: 400),
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else {
                                      final weatherData = snapshot.data;
                                      final currentTemp =
                                          weatherData!['current']['temp_c']
                                              .toString();
                                      final name = weatherData!['location']
                                              ['name']
                                          .toString();
                                      final ostan = weatherData!['location']
                                              ['region']
                                          .toString();
                                      final imageUrl = weatherData!['current']
                                          ['condition']['icon'];
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 160,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors.blueGrey[900]!,
                                                      Colors.blueGrey[900]!,
                                                      Colors.blueGrey,
                                                      Colors.blueGrey,
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    stops: [0.0, 0.5, 0.5, 1.0],
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black,
                                                      offset: Offset(0, 0),
                                                    ),
                                                  ],
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              " State: $ostan",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                              height: 50,
                                                            ),
                                                            Text(
                                                              " City: $name",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.network(
                                                              'https:$imageUrl', // مسیر تصویر
                                                              width:
                                                                  100, // عرض تصویر
                                                              height:
                                                                  80, // ارتفاع تصویر
                                                              fit: BoxFit
                                                                  .cover, // تنظیم نوع تغییر اندازه تصویر
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                              height: 60,
                                                            ),
                                                            Text(
                                                              " whather: $currentTemp",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(100),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blueGrey[900]!,
                              Colors.blueGrey[900]!,
                              Colors.blueGrey,
                              Colors.blueGrey,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.5, 0.5, 1.0],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FutureBuilder(
                                  future: WeatherApi().fetchWeather('cologne'),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Padding(
                                        padding: EdgeInsets.only(top: 400),
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else {
                                      final weatherData = snapshot.data;
                                      final currentTemp =
                                          weatherData!['current']['temp_c']
                                              .toString();
                                      final name = weatherData!['location']
                                              ['name']
                                          .toString();
                                      final ostan = weatherData!['location']
                                              ['region']
                                          .toString();
                                      final imageUrl = weatherData!['current']
                                          ['condition']['icon'];
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 160,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors.blueGrey[900]!,
                                                      Colors.blueGrey[900]!,
                                                      Colors.blueGrey,
                                                      Colors.blueGrey,
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    stops: [0.0, 0.5, 0.5, 1.0],
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black,
                                                      offset: Offset(0, 0),
                                                    ),
                                                  ],
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              " State: $ostan",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                              height: 50,
                                                            ),
                                                            Text(
                                                              " City: $name",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.network(
                                                              'https:$imageUrl', // مسیر تصویر
                                                              width:
                                                                  100, // عرض تصویر
                                                              height:
                                                                  80, // ارتفاع تصویر
                                                              fit: BoxFit
                                                                  .cover, // تنظیم نوع تغییر اندازه تصویر
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                              height: 60,
                                                            ),
                                                            Text(
                                                              " whather: $currentTemp",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(100),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blueGrey[900]!,
                              Colors.blueGrey[900]!,
                              Colors.blueGrey,
                              Colors.blueGrey,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.5, 0.5, 1.0],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FutureBuilder(
                                  future:
                                      WeatherApi().fetchWeather('frankfurt'),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Padding(
                                        padding: EdgeInsets.only(top: 400),
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else {
                                      final weatherData = snapshot.data;
                                      final currentTemp =
                                          weatherData!['current']['temp_c']
                                              .toString();
                                      final name = weatherData!['location']
                                              ['name']
                                          .toString();
                                      final ostan = weatherData!['location']
                                              ['region']
                                          .toString();
                                      final imageUrl = weatherData!['current']
                                          ['condition']['icon'];
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 160,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors.blueGrey[900]!,
                                                      Colors.blueGrey[900]!,
                                                      Colors.blueGrey,
                                                      Colors.blueGrey,
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    stops: [0.0, 0.5, 0.5, 1.0],
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black,
                                                      offset: Offset(0, 0),
                                                    ),
                                                  ],
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              " State: $ostan",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                              height: 50,
                                                            ),
                                                            Text(
                                                              " City: $name",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.network(
                                                              'https:$imageUrl', // مسیر تصویر
                                                              width:
                                                                  100, // عرض تصویر
                                                              height:
                                                                  80, // ارتفاع تصویر
                                                              fit: BoxFit
                                                                  .cover, // تنظیم نوع تغییر اندازه تصویر
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                              height: 60,
                                                            ),
                                                            Text(
                                                              " whather: $currentTemp",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
