import 'package:flutter/material.dart';
import 'package:manager_tracker/Models/CardModel.dart';
import 'package:manager_tracker/Provider/CardProvider.dart';
import 'package:provider/provider.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController availableController = TextEditingController();
  TextEditingController currencyController = TextEditingController();

  void onAdd() {
    CardModel card = CardModel(
      name: nameController.text,
      number: numberController.text,
      currency: currencyController.text,
      bankName: bankNameController.text,
      available: int.parse(availableController.text),
    );

    Provider.of<CardProvider>(context, listen: false).addCard(card);

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
          'Add Card',
          style: TextStyle(color: Colors.black),
        ),
        brightness: Brightness.light,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: 20,
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Card Name',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Card Number',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: bankNameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Bank Name',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: availableController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Available Balance',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: currencyController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Currency',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              MaterialButton(
                onPressed: () => onAdd(),
                elevation: 0,
                minWidth: double.infinity,
                color: Colors.blue,
                padding: const EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: const Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
