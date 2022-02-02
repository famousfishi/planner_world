import 'package:flutter/material.dart';
import './models/transaction.dart';

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

// initialize to an empty List/Array
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', amount: 300.00, date: DateTime.now(), title: 'New Mac Book'),
    Transaction(
        id: 't2', amount: 500.00, date: DateTime.now(), title: 'New iPhone'),
    Transaction(
        id: 't3', amount: 800.00, date: DateTime.now(), title: 'New airpods'),
    Transaction(
        id: 't4',
        amount: 500.00,
        date: DateTime.now(),
        title: 'New apple music'),
    Transaction(
        id: 't5', amount: 450.00, date: DateTime.now(), title: 'New iWatch')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Planner'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            SizedBox(
              width: double.infinity,
              // ignore: prefer_const_constructors
              child: Card(
                color: Colors.amberAccent,
                child: const Text('CHARTS'),
              ),
            ),
            Column(
                children: transactions
                    .map((transaction) => Card(
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.purple, width: 2.0)),
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  transaction.amount.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.purple),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    transaction.title,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    transaction.date.toString(),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12.0),
                                  )
                                ],
                              )
                            ],
                          ),
                        ))
                    .toList())
          ],
        ));
  }
}
