import 'package:flutter/material.dart';
import 'package:ew_app/config/routes.dart';
void main() {
  runApp(const EwApp()
  );
}

class EwApp extends StatelessWidget {
  const EwApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: routes,
    );
  }
}