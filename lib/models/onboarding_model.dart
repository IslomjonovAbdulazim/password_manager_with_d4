import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isOnboardingDone() async {
  //    data base
  final db = await SharedPreferences.getInstance();
  bool? result = db.getBool("onboarding");
  return result == true;
}

Future<void> onboardingDone() async {
  final db = await SharedPreferences.getInstance();
  await db.setBool("onboarding", true);
}
