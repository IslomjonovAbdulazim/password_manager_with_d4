import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List titles = ["Manage Passwords", "All In One Place", "Smart Categories"];
  List subtitles = [
    "Secured with the end-to-end AES-256 encryption.",
    "Store docs, credentials, bank cards, or IDs.",
    "Stay organized and create your own categories.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Image

            // Texts

            // Indicator

            // Button
          ],
        ),
      ),
    );
  }
}
