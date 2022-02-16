import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sharedpreference/sharedpreference.dart';

import 'models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);
  
  String displayName = "";
  @override 
  void initState() {
    getData();
    
  }
  getData() async {
    SharedPreference prefs = await SharedPreference.getInstance();
    setState((){

    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Center(
                  child: Text(
                    'Not a Transaction added yet!',
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  height: 250,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 8,
                  margin: EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 4,
                  ),
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: FittedBox(
                              child: Text('\₹${transactions[index].amount}')),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        // ignore: deprecated_member_use
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => deleteTx(transactions[index].id),
                      )),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
