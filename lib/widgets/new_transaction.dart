import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  // final Function voidCallbackUse;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
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
    return SingleChildScrollView(
      child: Card(
        margin: const EdgeInsets.all(15.0),
        elevation: 5.0,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
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
                    style: TextStyle(color: Colors.teal),
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
      ),
    );
  }

  mySnackBar(String content, String label, Function onPressed) {
    final snackBar = SnackBar(
      content: Text(content),
      action: SnackBarAction(
        label: label,
        onPressed: onPressed(),
      ),
    );

    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty) {
      mySnackBar('Your title is empty', 'Undo', () {});
    } else if (amountController.text.isEmpty) {
      mySnackBar('Your amount empty', 'Undo', () {});
    }

    //else add the new transaction

    widget.addNewTransaction(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }
}
