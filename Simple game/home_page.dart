import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  bool flip = true;
  int a = 1;
  List<String> xo = [
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
  ];
  List<bool> clicked = [true, true, true, true, true, true, true, true, true];
  List<GlobalKey<FlipCardState>> cardStateKeys = [
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Krizic Kruzic",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.amber[600],
              width: MediaQuery.of(context).size.width,
              height: 48.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Player 1 ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "VS",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Player 2 ",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.amber[600],
              width: MediaQuery.of(context).size.width,
              height: 48.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "O",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "-",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "X ",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Theme(
              data: ThemeData.dark(),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) => FlipCard(
                    key: cardStateKeys[index],
                    onFlip: () {
                      if (clicked[index] == false) {
                        clicked[index] = false;
                      } else {
                        setState(() {
                          clicked[index] = false;
                        });
                      }

                      if (a % 2 == 0) {
                        setState(() {
                          xo[index] = "X";
                        });
                      } else {
                        setState(() {
                          xo[index] = "O";
                        });
                      }
                      setState(() {
                        a = a + 1;
                      });

                      if ((xo[0] == "X" && xo[1] == "X" && xo[2] == "X") ||
                          (xo[3] == "X" && xo[4] == "X" && xo[5] == "X") ||
                          (xo[6] == "X" && xo[7] == "X" && xo[8] == "X") ||
                          (xo[0] == "X" && xo[3] == "X" && xo[6] == "X") ||
                          (xo[1] == "X" && xo[4] == "X" && xo[7] == "X") ||
                          (xo[2] == "X" && xo[5] == "X" && xo[8] == "X") ||
                          (xo[0] == "X" && xo[4] == "X" && xo[8] == "X") ||
                          (xo[2] == "X" && xo[4] == "X" && xo[6] == "X") ||
                          (xo[0] == "O" && xo[1] == "O" && xo[2] == "O") ||
                          (xo[3] == "O" && xo[4] == "O" && xo[5] == "O") ||
                          (xo[6] == "O" && xo[7] == "O" && xo[8] == "O") ||
                          (xo[0] == "O" && xo[3] == "O" && xo[6] == "O") ||
                          (xo[1] == "O" && xo[4] == "O" && xo[7] == "O") ||
                          (xo[2] == "O" && xo[5] == "O" && xo[8] == "O") ||
                          (xo[0] == "O" && xo[4] == "O" && xo[8] == "O") ||
                          (xo[2] == "O" && xo[4] == "O" && xo[6] == "O")) {
                        print("end");
                        setState(() {
                          clicked[index] = false;
                        });
                        BuildContext dialogContext;
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            dialogContext = context;
                            return Dialog(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircularProgressIndicator(),
                                  Text('${xo[index]}'),
                                  TextButton(
                                    onPressed: restart(),
                                    child: Text("Botun"),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                    direction: FlipDirection.HORIZONTAL,
                    flipOnTouch: clicked[index],
                    front: Container(
                        margin: EdgeInsets.all(4.0),
                        color: Colors.orangeAccent),
                    back: Container(
                      margin: EdgeInsets.all(4.0),
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          '${xo[index]}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  itemCount: 9,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  restart() {
    Widget build(BuildContext context) {
      return Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Krizic Kruzic",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.amber[600],
                width: MediaQuery.of(context).size.width,
                height: 48.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "Player 1 ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "VS",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Player 2 ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.amber[600],
                width: MediaQuery.of(context).size.width,
                height: 48.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "O",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "-",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "X ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Theme(
                data: ThemeData.dark(),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) => FlipCard(
                      key: cardStateKeys[index],
                      onFlip: () {
                        if (clicked[index] == false) {
                          clicked[index] = false;
                        } else {
                          setState(() {
                            clicked[index] = false;
                          });
                        }

                        if (a % 2 == 0) {
                          setState(() {
                            xo[index] = "X";
                          });
                        } else {
                          setState(() {
                            xo[index] = "O";
                          });
                        }
                        setState(() {
                          a = a + 1;
                        });

                        if ((xo[0] == "X" && xo[1] == "X" && xo[2] == "X") ||
                            (xo[3] == "X" && xo[4] == "X" && xo[5] == "X") ||
                            (xo[6] == "X" && xo[7] == "X" && xo[8] == "X") ||
                            (xo[0] == "X" && xo[3] == "X" && xo[6] == "X") ||
                            (xo[1] == "X" && xo[4] == "X" && xo[7] == "X") ||
                            (xo[2] == "X" && xo[5] == "X" && xo[8] == "X") ||
                            (xo[0] == "X" && xo[4] == "X" && xo[8] == "X") ||
                            (xo[2] == "X" && xo[4] == "X" && xo[6] == "X") ||
                            (xo[0] == "O" && xo[1] == "O" && xo[2] == "O") ||
                            (xo[3] == "O" && xo[4] == "O" && xo[5] == "O") ||
                            (xo[6] == "O" && xo[7] == "O" && xo[8] == "O") ||
                            (xo[0] == "O" && xo[3] == "O" && xo[6] == "O") ||
                            (xo[1] == "O" && xo[4] == "O" && xo[7] == "O") ||
                            (xo[2] == "O" && xo[5] == "O" && xo[8] == "O") ||
                            (xo[0] == "O" && xo[4] == "O" && xo[8] == "O") ||
                            (xo[2] == "O" && xo[4] == "O" && xo[6] == "O")) {
                          print("end");
                          setState(() {
                            clicked[index] = false;
                          });
                          BuildContext dialogContext; // <<----
                          showDialog(
                            context: context, // <<----
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              dialogContext = context;
                              return Dialog(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircularProgressIndicator(),
                                    Text('${xo[index]}'),
                                    TextButton(
                                        onPressed: null, child: Text("Botun"))
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                      direction: FlipDirection.HORIZONTAL,
                      flipOnTouch: clicked[index],
                      front: Container(
                          margin: EdgeInsets.all(4.0), color: Colors.grey),
                      back: Container(
                        margin: EdgeInsets.all(4.0),
                        color: Colors.blue,
                        child: Text(
                          '${xo[index]}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    itemCount: 9,
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    }
  }
}
