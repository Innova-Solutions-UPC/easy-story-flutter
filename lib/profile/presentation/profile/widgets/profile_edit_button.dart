import 'package:flutter/material.dart';

import '../../../../common/exceptions/server_exceptions.dart';

Widget ProfileButtonEdit(context) {
  return FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 38, 161, 199),
      onPressed: () async {
        try {
          Navigator.pushNamed(context, '/profile');
        } catch (e) {
          print(e);
          return ServerException()();
        }
      },
      child: Icon(
        Icons.edit,
      ));
}
