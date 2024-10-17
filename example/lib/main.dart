import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moon_gauge_bar/moon_gauge_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('moon gauge bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            SizedBox(
              width: 200,
              height: 200,
              child: MoonGaugeBar.halfCircularGaugeBar(
                score: score,
                labelStyle: const MoonGaugeLabelStyleUIModel(
                  startPointText: "0",
                  endPointText: "100",
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  score = Random().nextInt(100).toDouble();
                });
              },
              child: const Text('change')
            )


          ],
        ),
      ),
    );
  }
}
