import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  // final Function voidCallbackUse;

  NewTransaction({required this.addNewTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // String amountInput = '';
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15.0),
      elevation: 5.0,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              onSubmitted: (_) => submitData(),
              controller: titleController,
            ),
            TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
                decoration: const InputDecoration(
                  labelText: 'Amount',
                )),
            TextButton(
                onPressed: submitData,
                child: const Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.purple),
                )),
            // TextButton(
            //     onPressed: () {
            //       voidCallbackUse;
            //     },
            //     child: Text(
            //       'Use callback',
            //       style: TextStyle(color: Colors.purple),
            //     ))
          ],
        ),
      ),
    );
  }

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addNewTransaction(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }
}
