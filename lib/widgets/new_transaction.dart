import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addNewTx);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Title'),
          controller: titleController,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Amount'),
          controller: amountController,
        ),
        FlatButton(
          onPressed: () {
            addNewTx(titleController.text, amountController.text);
          },
          child: Text("Add Transaction"),
          textColor: Colors.red,
        ),
      ],
    );
  }
}
