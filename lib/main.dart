import 'package:flutter/material.dart';
import 'package:manager_tracker/Provider/CardProvider.dart';
import 'package:manager_tracker/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CardProvider>(
      create: (context) => CardProvider(),
      child: MaterialApp(
        title: 'Mnager Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
