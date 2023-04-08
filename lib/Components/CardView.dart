import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import '../Models/CardModel.dart';

class CardView extends StatefulWidget {
  final CardModel card;

  CardView(this.card) : super();

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.1 / 2,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(right: 20.0),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(-15, 0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.8),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          " " +widget.card.available.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.card.currency,
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        widget.card.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        widget.card.number,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            letterSpacing: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
