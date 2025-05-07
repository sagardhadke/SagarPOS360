import 'package:flutter/material.dart';

class MyLoginRegister extends StatelessWidget {
  const MyLoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
                "assets/icons/app-logo.png",
                height: 250,
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
        ],  
      ),
    );
  }
}
