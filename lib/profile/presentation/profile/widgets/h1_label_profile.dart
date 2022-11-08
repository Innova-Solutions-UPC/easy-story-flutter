import 'package:flutter/material.dart';

class H1Label extends StatelessWidget {
  String h1;
  H1Label(
    this.h1,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          h1,
          style: TextStyle(
              color: Color.fromARGB(246, 0, 0, 0),
              fontSize: 21,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
