import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water/Screen/contry/Amereca.dart';
import 'package:water/Screen/contry/Germany.dart';
import 'package:water/Screen/contry/china.dart';
import 'package:water/Screen/contry/Iran.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSunny = true;
  Color textColor = Colors.white;
  Color icon = Colors.white;
  Color bagrund = Color.fromARGB(255, 3, 7, 40);
  Color scafold = Color.fromARGB(255, 96, 125, 139);
  String header = 'Assets/images/night.png';
  var currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
  String currentCanadaTime = '10:5';
  String currentGermanyTime = '11:43';
  String currentchinaTime = '11:47';

  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
        currentCanadaTime = DateFormat('HH:mm:ss')
            .format(DateTime.now().add(Duration(hours: 16, minutes: 30)));
        currentGermanyTime = DateFormat('HH:mm:ss')
            .format(DateTime.now().add(Duration(hours: 22, minutes: 30)));
        currentchinaTime = DateFormat('HH:mm:ss')
            .format(DateTime.now().add(Duration(hours: 4, minutes: 30)));
      });
    });
    //API();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafold,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isSunny = !isSunny;
                  textColor = isSunny ? Colors.white : Colors.black;
                  icon = isSunny ? Colors.white : Colors.black;
                  scafold = isSunny
                      ? Color.fromARGB(255, 96, 125, 139)
                      : Colors.white;
                  header = isSunny
                      ? 'Assets/images/night.png'
                      : 'Assets/images/sun.png';
                  bagrund = isSunny
                      ? Color.fromARGB(255, 3, 7, 40)
                      : Color.fromARGB(255, 6, 112, 133);
                });
              },
              icon: Icon(
                isSunny ? Icons.sunny : Icons.nightlight_round,
                color: icon,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SafeArea(
                        child: Container(
                          width: 350,
                          height: 500,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.cyan,
                                    blurRadius: 20,
                                    spreadRadius: 2)
                              ],
                              color: bagrund,
                              borderRadius: BorderRadius.circular(30)),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    width: 280,
                                    height: 250,
                                    child: Image.asset(header),
                                  ),
                                ),
                                Text(
                                  "The climate of the capitals",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: textColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SafeArea(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Iran(),
                                            ));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            child: Image.network(
                                                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Flag_of_Iran.svg/255px-Flag_of_Iran.svg.png"),
                                          ),
                                          Text(
                                            'Iran',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            currentTime,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SafeArea(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Amereca(),
                                            ));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            child: Image.network(
                                              "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Flag_of_the_United_States_%28Pantone%29.svg/1200px-Flag_of_the_United_States_%28Pantone%29.svg.png",
                                            ),
                                          ),
                                          Text(
                                            'American',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            currentCanadaTime,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SafeArea(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Germany(),
                                            ));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            child: Image.network(
                                              "https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Flag_of_Germany.svg/1200px-Flag_of_Germany.svg.png",
                                            ),
                                          ),
                                          Text(
                                            'Germany',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            currentGermanyTime,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: SafeArea(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => china(),
                                              ));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              child: Image.network(
                                                "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/1280px-Flag_of_the_People%27s_Republic_of_China.svg.png",
                                              ),
                                            ),
                                            Text(
                                              'china',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              currentchinaTime,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text("Click on the country icon")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
