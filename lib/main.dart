import 'package:flutter/material.dart';
import 'package:marvelcatalogo/pages/detalhes.dart';
import 'package:marvelcatalogo/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel catálogo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        "/": (context) => Home(),
        "/detalhes": (context) => Detalhes(),
      },
      initialRoute: "/",
    );
  }
}