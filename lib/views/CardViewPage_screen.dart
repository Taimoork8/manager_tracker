import 'package:flutter/material.dart';
import 'package:manager_tracker/Components/CardView.dart';
import 'package:manager_tracker/Models/CardModel.dart';
import 'package:manager_tracker/Provider/CardProvider.dart';
import 'package:provider/provider.dart';

class CardViewScreen extends StatefulWidget {
  final CardModel card;
  const CardViewScreen({Key? key,required this.card}) : super(key: key);

  @override
  State<CardViewScreen> createState() => _CardViewScreenState();
}

class _CardViewScreenState extends State<CardViewScreen> {
  
  void onRemove(CardModel card){
    Provider.of<CardProvider>(context, listen: false).removeCard(card);

    Navigator.of(context).pop(true);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Card View',
          style: TextStyle(color: Colors.black),
        ),
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: 20,
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        actions: [
          IconButton(
            onPressed: (){
              onRemove(widget.card);
            },
            icon: const Icon(Icons.delete,color: Colors.black45),
            ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Transform.translate(
            offset: Offset.fromDirection(0, 15),
            child: Container(
              height: 210,
              child: CardView(widget.card),
            ),
          ),
        ),
      ),
    );
  }
}
