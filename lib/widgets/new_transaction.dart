import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction(this.addNewTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime _seletedDate;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredAmount <= 0 || enteredTitle.isEmpty || _seletedDate == null)
      return;
    setState(() {
      widget.addNewTx(enteredTitle, enteredAmount, _seletedDate);
      _seletedDate = null;
    });
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _seletedDate = pickedDate;
      });
    });
  }

//  done
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
          Row(
            children: [
              Text(
                _seletedDate == null
                    ? "No Date Choose!"
                    : DateFormat.yMd().format(_seletedDate),
                style: TextStyle(color: Colors.grey),
              ),
              FlatButton(
                onPressed: _presentDatePicker,
                child: Text(
                  "Choose Date ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                textColor: Colors.purple,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: submitData,
            child: Text(
              "Add Transaction",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            textColor: Colors.purple,
            color: Colors.white70,
          ),
        ],
      ),
    );
  }
}
