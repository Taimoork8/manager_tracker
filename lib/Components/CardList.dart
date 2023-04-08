import 'package:flutter/material.dart';
import 'package:manager_tracker/Components/CardView.dart';
import 'package:manager_tracker/Models/CardModel.dart';
import 'package:manager_tracker/views/CardViewPage_screen.dart';

class CardList extends StatelessWidget {
  final List<CardModel> cards;

  const CardList({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: getChildrenCards(context),
    );
  }

  List<Widget> getChildrenCards(context) {
    return cards
        .map((card) => GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardViewScreen(card: card)));
              },
              child: CardView(card),
            ))
        .toList();
  }
}
