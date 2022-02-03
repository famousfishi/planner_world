import 'package:flutter/material.dart';
import '../models/transaction.dart';

class NewTransaction extends StatelessWidget {
  // String amountInput = '';
  // String titleInput = '';

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addNewTransaction;

  final Function voidCallbackUse;

  NewTransaction(
      {required this.addNewTransaction, required this.voidCallbackUse});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15.0),
      elevation: 5.0,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (value) {
              //   titleInput = value;
              // },
              controller: titleController,
            ),
            TextField(
                // onChanged: (value) {
                //   amountInput = value;
                // },
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                )),
            TextButton(
                onPressed: () {
                  addNewTransaction(titleController.text,
                      double.parse(amountController.text));
                },
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.purple),
                )),
            TextButton(
                onPressed: () {
                  voidCallbackUse;
                },
                child: Text(
                  'Use callback',
                  style: TextStyle(color: Colors.purple),
                ))
          ],
        ),
      ),
    );
  }
}
