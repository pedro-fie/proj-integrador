import 'package:flutter/material.dart';

PreferredSizeWidget getTopBar(String text, List<Widget>? action) {
  return AppBar(
    title: Text(text),
    backgroundColor: const Color(0xFF2C3639),
    centerTitle: true,
    actions: action,
  );
}
