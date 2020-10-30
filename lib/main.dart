import 'package:flutter/material.dart';
import 'package:joke_app/view/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        "first": (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
      title: "Jokes App",
      home: Scaffold(
        body: HomePage(),
      ),
    ),
  );
}
