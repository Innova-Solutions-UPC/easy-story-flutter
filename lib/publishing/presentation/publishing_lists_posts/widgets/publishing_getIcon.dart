import 'package:flutter/material.dart';

Icon getIcon(bool isActive) {
  if (isActive) {
    return Icon(Icons.bookmark_added_outlined);
  } else {
    return Icon(Icons.bookmark_add_outlined);
  }
}
