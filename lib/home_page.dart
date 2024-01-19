// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_print

import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String buttonText = "Turn On"; // Initial button text
  int flag = 1;
  //ADDED
  final torchController = TorchController();

  // Function to be called when the button is pressed
  void func() async {
    // Your function logic here
    print("Button clicked!");

    // Perform asynchronous operation outside setState
    bool? result = await torchController.toggle();

    // Handle the nullable result
    bool active = result ?? false;

    // Update the button text inside setState
    setState(() {
      if (flag % 2 == 1) {
        buttonText = "Turn Off";

        if (active) {
          print("Torch is active!");
        }

        flag++;
      } else {
        buttonText = "Turn On";
        flag++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set this to false
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Torch App',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 42,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: func,
                  style: ElevatedButton.styleFrom(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      // Adjust the radius as needed
                    ),
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),

                  // Use buttonText variable for the text
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
