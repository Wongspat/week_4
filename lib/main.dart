
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CP-SU LED MATRIX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<homepage> {
  int value = 0;
  var dotsData = [
    // Digit 0
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 1
    [
      [0, 0, 1, 0, 0],
      [0, 1, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 1, 1, 0],
    ],
    // Digit 2
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [1, 1, 1, 1, 1],
    ],
    // Digit 3
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 4
    [
      [0, 0, 0, 1, 0],
      [0, 0, 1, 1, 0],
      [0, 1, 0, 1, 0],
      [1, 0, 0, 1, 0],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 0, 1, 0],
    ],
    // Digit 5
    [
      [1, 1, 1, 1, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 6
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 7
    [
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
    ],
    // Digit 8
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 9
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ]
  ];

  void update(int increment) {
    setState(() {
      if (increment > 0) {
        if (value == 99) {
          value = 0;
        } else {
          value++;
        }
      } else {
        if (value == 0) {
          value = 99;
        } else {
          value--;
        }
      }
    });
  }

  @override
Widget build(BuildContext context) {
  int value1 = value ~/ 10;
  int value2 = value % 10;
  return Scaffold(
    appBar: appbarBuild(),
    backgroundColor: Colors.purple[200],
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
        ),
        button1(),
        Container(
          margin: EdgeInsets.all(50),
          padding: EdgeInsets.all(50),
          width: 400,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.white, width: 13),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildDis(value1),
              Container(
                width: 15,
              ),
              buildDis(value2),
            ],
          ),
        ),
        button2(),
        Container(
          height: 40,
        ),
      ],
    ),
  );
}

AppBar appbarBuild() {
  return AppBar(
    title: Text('CP-SU LED MATRIX'),
    centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    backgroundColor: Colors.purple,
  );
}


  Widget button1() {
    return InkWell(
      onTap: () {
        update(1);
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          Icons.change_history,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget button2() {
    return InkWell(
      onTap: () {
        update(-1);
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          Icons.change_history,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildDot(int value) {
    if (value == 1) {
      return Container(
        color: Colors.black,
        child: Icon(
          Icons.change_history,
          color: Colors.lightGreenAccent,
        ),
      );
    }
    return Container(
      child: Icon(
        Icons.change_history,
        color: const Color.fromARGB(255, 33, 34, 34),
      ),
    );
  }

  Widget _Row(List<int> dotsData) {
    return Row(
      children: [
        for (int i = 0; i < dotsData.length; i++) _buildDot(dotsData[i]),
      ],
    );
  }

  Widget buildDigit(int value) {
    return Column(
      children: [
        for (int j = 0; j < dotsData[value].length; j++)
          _Row(dotsData[value][j]),
      ],
    );
  }

  Widget buildDis(int value) {
    return Column(
      children: [
        buildDigit(value),
      ],
    );
  }
}
