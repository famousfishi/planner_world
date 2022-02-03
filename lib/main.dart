import 'dart:ui';

import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('Planner'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                width: double.infinity,
                // ignore: prefer_const_constructors
                child: Card(
                  color: Colors.purple,
                  child: const Text(
                    'CHARTS',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              UserTransaction()
            ],
          ),
        ));
  }
}
