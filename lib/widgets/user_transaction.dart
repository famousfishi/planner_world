import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', amount: 300.00, date: DateTime.now(), title: 'New Mac Book'),
    Transaction(
        id: 't2', amount: 500.00, date: DateTime.now(), title: 'New iPhone'),
  ];

  String testCallBackString = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
          addNewTransaction: _addNewTransaction,
          voidCallbackUse: _test,
        ),
        TransactionList(
          transactionList: _transactions,
        )
      ],
    );
  }

  String _test() {
    setState(() {
      testCallBackString = "test";
    });
    return testCallBackString;
  }

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
}
