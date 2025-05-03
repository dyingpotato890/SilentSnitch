import 'package:flutter/material.dart';

import 'package:silent_snitch/pages/operation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SilentSnitch',
      theme: ThemeData(useMaterial3: true),

      debugShowCheckedModeBanner: false,

      home: OperationPage()
    );
  }
}