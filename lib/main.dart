import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', amount: 30.00, date: DateTime.now(), title: 'New Mac Book'),
    Transaction(
        id: 't2', amount: 50.00, date: DateTime.now(), title: 'New iPhone'),
  ];

  void _addNewTransaction(String transactionTitle, double transactionAmount) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        amount: transactionAmount,
        date: DateTime.now(),
        title: transactionTitle);

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Personal Expenses'),
        actions: [
          IconButton(
              onPressed: () => _startModalBottomSheet(context),
              icon: const Icon(Icons.add))
        ],
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
                color: Theme.of(context).primaryColor,
                child: const Text(
                  'CHARTS',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            TransactionList(transactionList: _transactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startModalBottomSheet(context),
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  void _startModalBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewTransaction(addNewTransaction: _addNewTransaction));
        });
  }
}
