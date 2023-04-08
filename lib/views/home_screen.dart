import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manager_tracker/Components/CardList.dart';
import 'package:manager_tracker/Components/CardView.dart';
import 'package:manager_tracker/Components/TransactionView.dart';
import 'package:manager_tracker/Models/CardModel.dart';
import 'package:manager_tracker/Models/TransactionModle.dart';
import 'package:manager_tracker/Provider/CardProvider.dart';
import 'dart:developer' as dev;
import 'package:manager_tracker/views/AddCard_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<CardProvider>(context, listen: false).initialState();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: const Color.fromRGBO(238, 241, 242, 1),
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        leading: null,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddCardScreen()));
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black45,
            ),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              (Provider.of<CardProvider>(context).getCardLength() > 0
                  ? Container(
                      height: 210,
                      child: Consumer<CardProvider>(
                        builder: (context, cards, child) => CardList(
                          cards: cards.allCards,
                        ),
                      ))
                  : Container(
                      height: 210,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Add your new card click the \n + \n button in the top right.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    )),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                'Last Transactions',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.black54),
              ),
              SizedBox(
                height: 15.0,
              ),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Shopping', price: 250, type: '-', currency: 'US'),
              ),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Shopping', price: 150, type: '-', currency: 'US'),
              ),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Salary', price: 450, type: '+', currency: 'US'),
              ),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Bonus', price: 50, type: '+', currency: 'US'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
