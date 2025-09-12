import 'package:flutter/material.dart';

import 'home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //logo
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Image(image: AssetImage('assets/images/carrot.png')),
          ),
          Text(
            'We Deliver Groceries at your Doorstep',
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          //We deliver groceries at your doorstep
          Text('Fresh item everyday'),
          //fresh items everyday
          GestureDetector(
            onTap: () {
              //navigate to home page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
                  },
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 50),
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          //Get Started button
        ],
      ),
    );
  }
}
