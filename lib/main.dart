import 'package:flutter/material.dart';
import 'package:khatabook/widgets/chart.dart';
import 'package:khatabook/widgets/new_transaction.dart';

// import 'package:khatabook/widgets/user_transaction.dart';

import 'models/transaction.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.purple, accentColor: Colors.amber),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(
      id: "Ti",
      title: "New Shoes",
      amount: 69.9,
      date: DateTime.now(),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _addTransaction(String title, double amount) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        id: DateTime.now().toString(),
        date: DateTime.now());
    setState(() {
      transactions.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Khatabook"),
        // centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).accentColor,
                  size: 40,
                ),
                onPressed: () {
                  startAddNewTransaction(context);
                }),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(_recentTransactions),
            // UserTransactions(),
            TransactionList(transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startAddNewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
