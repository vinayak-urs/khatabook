import 'package:flutter/material.dart';
import 'package:khatabook/models/transaction.dart';
import 'package:khatabook/widgets/new_transaction.dart';
import 'package:khatabook/widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [
    Transaction(
      id: "Ti",
      title: "New Shoes",
      amount: 69.9,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String title, String amount) {
    final newTx = Transaction(
        title: title,
        amount: amount != null ? double.parse(amount) : 0.0,
        id: DateTime.now().toString(),
        date: DateTime.now());
    setState(() {
      transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addTransaction),
        TransactionList(transactions),
      ],
    );
  }
}
