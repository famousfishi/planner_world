import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_personal_planner/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  TransactionList({required this.transactionList});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactionList
            .map((transaction) => Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.purple, width: 2.0)),
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          '\$${transaction.amount}',
                          style: const TextStyle(
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
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMMMd().format(transaction.date),
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12.0),
                          )
                        ],
                      )
                    ],
                  ),
                ))
            .toList());
  }
}
