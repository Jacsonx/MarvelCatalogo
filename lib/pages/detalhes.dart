import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget {
  final String idCharacter;

  const Detalhes({Key key})

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes")
      ),
      body: Container(
        child: Text("detalhes"),
      ),
    );
  }
}