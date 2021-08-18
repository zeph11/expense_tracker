import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Debt extends StatelessWidget {
  final String name;
  final int amount;

  Debt({this.name, this.amount});

  factory Debt.CustomModel(DocumentSnapshot doc) {
    return Debt(name: doc['name'], amount: doc['amount']);
  }

  getprefix() {
    if (amount > 0) {
      return Text("To: ",
          style: TextStyle(
            fontSize: 17,
          ));
    } else if (amount < 0) {
      return Text("From: ",
          style: TextStyle(
            fontSize: 17,
          ));
    } else {
      return Text("  --   ");
    }
  }

  getamount() {
    if (amount > 0) {
      return Text(amount.toString(),
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.green[800],
          ));
    } else if (amount < 0) {
      print('else');
      return Text(amount.toString(),
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.red[800],
          ));
    } else {
      return Text(amount.toString(),
          style: TextStyle(
            fontSize: 20.0,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(child: getprefix()),
              Text(name,
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
            ],
          ),
          SizedBox(height: 8),
          Container(child: getamount()),
        ],
      ),
    );
  }
}