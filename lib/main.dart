// main.dart
import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';
import 'home_page.dart';

void main() {
  //Added
  TorchController().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Set this to false

      home: const HomePage(),
    );
  }
}
