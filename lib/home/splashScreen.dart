import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    splashScreen(),
  );
}

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  void initState() {
    super.initState();
    // Wait for 5 seconds and navigate to the home screen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/homePage');
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF1CAB4B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/image/splashScreen/chef.png')),
            Text(
              'Foodie',
              style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'font2',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1),
            )
          ],
        ),
      ),
    );
  }
}
