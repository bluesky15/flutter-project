import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> resturants = [
    'McDonalds\'s',
    'Roscoe\'s Chiken & Waffles',
    'Olive Garden',
    'Pizza Hut',
    'Panda Express'
  ];
  // ignore: prefer_typing_uninitialized_variables
  var currentIndex;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("What do you want to eat?"),
          // ignore: unnecessary_null_comparison
          if (currentIndex != null)
            Text(
              resturants[currentIndex],
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          const Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          // TextButton(
          //   style: ButtonStyle(
          //     foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          //         (Set<MaterialState> states) {
          //       if (states.contains(MaterialState.disabled)) {
          //         return Colors.green;
          //       }
          //       return null; // Defer to the widget's default.
          //     }),
          //     overlayColor: MaterialStateProperty.resolveWith<Color?>(
          //         (Set<MaterialState> states) {
          //       if (states.contains(MaterialState.focused)) {
          //         return Colors.red;
          //       }
          //       if (states.contains(MaterialState.hovered)) {
          //         return Colors.green;
          //       }
          //       if (states.contains(MaterialState.pressed)) {
          //         return Colors.blue;
          //       }
          //       return null; // Defer to the widget's default.
          //     }),
          //   ),
          //   onPressed: () {},
          //   child: const Text(
          //     'Pick Resturants',
          //     style: TextStyle(color: Colors.white),
          //   ),
          // )
          ElevatedButton(
            style: ElevatedButton.styleFrom(elevation: 2),
            onPressed: () {
              updateIndex();
            },
            child: const Text('Pick Resturants'),
          )
        ],
      ))),
    );
  }

  void updateIndex() {
    final random = Random();
    final index = random.nextInt(resturants.length);
    setState(() {
      currentIndex = index;
    });
  }
}
