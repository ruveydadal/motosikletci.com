import 'package:aregon/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, routes: {
    '/': (context) => LoginPage(),
  }));
}
