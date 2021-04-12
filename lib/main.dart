import 'package:flutter/material.dart';

import 'package:khatabook/widgets/user_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Khatabook"),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.add), onPressed: null)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.purple,
                elevation: 5,
                child: Text(
                  "Chart",
                ),
              ),
            ),
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
