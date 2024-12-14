import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "images/background.png",
                fit: BoxFit.cover,
              ),
            ),
            Center(child: Image.asset("images/logo.jpg")),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}
