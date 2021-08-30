import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int randomNo1 = Random().nextInt(100);
  int randomNo2 = Random().nextInt(100);
  int randomNo3 = Random().nextInt(100);
  bool boole = Random().nextBool();
  int turnLeft = 3;
  late int result;
  int score = 0;
  @override
  void initState() {
    super.initState();
    (boole) ? result = randomNo1 + randomNo2 : result = randomNo3;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ramdom Number Additions"),
        ),
        body: (turnLeft == 0)
            ? gameOverContainer()
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Score:  $score",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Turn Left: $turnLeft",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Card(
                              color: Colors.red,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                height:
                                    MediaQuery.of(context).size.height / 2.5,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "$randomNo1",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 60,
                                              color: Colors.black26),
                                        ),
                                        Text(
                                          "+",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 60,
                                              color: Colors.black26),
                                        ),
                                        Text(
                                          "$randomNo2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 60,
                                              color: Colors.black26),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "=",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 60,color: Colors.black26),
                                    ),
                                    Text(
                                      (boole) ? "$result" : "$randomNo3",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 60,
                                          color: Colors.black26),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 6.5,
                          child: Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if (randomNo1 + randomNo2 == result) {
                                  setState(() {
                                    score++;
                                  });
                                } else {
                                  setState(() {
                                    turnLeft--;
                                  });
                                }
                                createRandomNumber();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green),
                              ),
                              child: Icon(
                                Icons.check,
                                size: 70,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 6.5,
                          child: Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              onPressed: () {
                                if (randomNo1 + randomNo2 != result) {
                                  setState(() {
                                    score++;
                                  });
                                } else {
                                  setState(() {
                                    turnLeft--;
                                  });
                                }
                                createRandomNumber();
                              },
                              child: Icon(
                                Icons.close,
                                size: 70,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
      ),
    );
  }

  createRandomNumber() {
    randomNo1 = Random().nextInt(100);
    randomNo2 = Random().nextInt(100);
    randomNo3 = Random().nextInt(100);
    boole = Random().nextBool();
    (boole) ? result = randomNo1 + randomNo2 : randomNo3 = randomNo3;
  }

  Widget gameOverContainer() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('images/e1.json'),
          SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10)),
            onPressed: () {
              setState(() {
                turnLeft = 3;
                score = 0;
                createRandomNumber();
              });
            },
            icon: Icon(
              Icons.restart_alt,
            ),
            label: Text(
              "Play Again",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
