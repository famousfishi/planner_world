import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_personal_planner/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  TransactionList({required this.transactionList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: transactionList.isEmpty
            ? Column(
                children: [
                  Text(
                    'No Transactions added yet',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: 30.0),
                  SizedBox(
                    height: 250,
                    child: Image.asset(
                      'assets/images/hourglass.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0)),
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '\$${transactionList[index].amount.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              // color: Colors.purple
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactionList[index].title,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat.yMMMd()
                                  .format(transactionList[index].date),
                              style: const TextStyle(
                                  // color: Colors.grey
                                  fontSize: 12.0),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: transactionList.length,
              ));
  }
}
