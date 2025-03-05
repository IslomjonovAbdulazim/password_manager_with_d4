import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_manager_with_d4/models/onboarding_model.dart';
import 'package:password_manager_with_d4/pages/home_page.dart';

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

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // Image
              Spacer(),
              AnimatedContainer(
                height: 260,
                width: 260,
                duration: Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img${currentPage + 1}.png"),
                  ),
                ),
              ),

              Spacer(),

              // Texts
              Text(
                titles[currentPage],
                style: GoogleFonts.ubuntuMono(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff1C1C1C),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  subtitles[currentPage],
                  style: GoogleFonts.ubuntuMono(
                    fontSize: 18,
                    height: 1.2,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff758393),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(flex: 2),

              // Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    height: 6,
                    width: currentPage == 0 ? 50 : 20,
                    duration: Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      color: Color(currentPage == 0 ? 0xffD5D5D5 : 0xffEBEBEB),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  SizedBox(width: 5),
                  AnimatedContainer(
                    height: 6,
                    width: currentPage == 1 ? 50 : 20,
                    duration: Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      color: Color(currentPage == 1 ? 0xffD5D5D5 : 0xffEBEBEB),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  SizedBox(width: 5),
                  AnimatedContainer(
                    height: 6,
                    width: currentPage == 2 ? 50 : 20,
                    duration: Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      color: Color(currentPage == 2 ? 0xffD5D5D5 : 0xffEBEBEB),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ],
              ),

              // Button
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: 60,
                  child: CupertinoButton(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                    onPressed: () {
                      if (currentPage < 2) {
                        currentPage++;
                        setState(() {});
                      } else {
                        onboardingDone();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }
                    },
                    child: Center(
                      child: Text(
                        "Continue",
                        style: GoogleFonts.ubuntuMono(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
