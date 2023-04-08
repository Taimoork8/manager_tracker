import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:manager_tracker/Models/CardModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardProvider with ChangeNotifier {
  List<CardModel> cards = [];

  UnmodifiableListView<CardModel> get allCards => UnmodifiableListView(cards);

  void initialState() {
    SyncDataWithProvider();
  }

  void addCard(CardModel _card) {
    cards.add(_card);

    updateSharedPreferences();

    notifyListeners();
  }

  void removeCard(CardModel _card) {
    cards.removeWhere((card) => card.number == _card.number);

    updateSharedPreferences();
    notifyListeners();
  }

  int getCardLength() {
    return cards.length;
  }

  void updateSharedPreferences() async {
    List<String> myCards = cards.map((f) => json.encode(f.toString())).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('cards', myCards);
  }

  Future SyncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getStringList('card');

    if (result != null) {
      cards = result.map((f) => CardModel.fromJson(json.decode(f))).toList();
    }

    notifyListeners();
  }
}
