import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction(this.addNewTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredAmount <= 0 || enteredTitle.isEmpty) return;
    widget.addNewTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            onPressed: submitData
            ,
            child: Text(
              "Add Transaction",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            textColor: Colors.purple,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
