import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khatabook/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;
  TransactionList(this.transactions, this._deleteTransaction);
  @override
  Widget build(BuildContext ctx) {
    return transactions.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No Transactions Yet !",
                style: TextStyle(fontSize: 30),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 6,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FittedBox(
                          child: Text("₹ ${transactions[index].amount}")),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () => _deleteTransaction(transactions[index].id),
                    // color: Colors.red,
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
