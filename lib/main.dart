import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_manager_with_d4/pages/onboarding_page.dart';

import 'models/onboarding_model.dart';
import 'pages/home_page.dart';

bool isHomePage = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final db = await SharedPreferences.getInstance();
  // db.clear();
  isHomePage = await isOnboardingDone();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => PasswordManagerApp(),
    ),
  );
}

class PasswordManagerApp extends StatelessWidget {
  const PasswordManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isHomePage ? HomePage() : OnboardingPage(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.noScaling,
          boldText: false,
        ),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: child ?? const Scaffold(),
        ),
      ),
    );
  }
}
