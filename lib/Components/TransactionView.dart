import 'package:flutter/material.dart';
import 'package:manager_tracker/Models/TransactionModle.dart';

class TransactionView extends StatefulWidget {
  final TransactionModel transaction;

  const TransactionView({super.key, required this.transaction});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
        Row(
          children: [
            widget.transaction.type == "-"? 
            Icon(Icons.arrow_upward, color: Colors.red,)
             :
            Icon(Icons.arrow_downward,color: Colors.green,),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.transaction.name,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              widget.transaction.type + widget.transaction.price.toString(),
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Text(
              " "+ widget.transaction.currency,
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
          ],
        ),
      ]),
    );
  }
}
