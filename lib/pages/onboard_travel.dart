import 'package:flutter/material.dart';
import 'package:trek_mate/models/onboard_model.dart';
import 'package:trek_mate/pages/createAccount.dart';
import 'package:trek_mate/pages/loginPage.dart'; 

class TravelOnBoardingScreen extends StatefulWidget {
  const TravelOnBoardingScreen({super.key});

  @override
  State<TravelOnBoardingScreen> createState() => _TravelOnBoardingScreenState();
}

class _TravelOnBoardingScreenState extends State<TravelOnBoardingScreen> {
  int currentIndex = 0;

  Widget dotIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.only(right: 6),
      width: 30,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: index == currentIndex ? Colors.white : Colors.white54,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: onboarding.length,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                onboarding[index].image,
                fit: BoxFit.cover,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreateAccountPage(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Visibility(
                          visible: onboarding.length - 1 != currentIndex,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "Skip",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 169, 154, 154),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      onboarding[currentIndex].name,
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Bitshow',
                        height: 1,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      onboarding[currentIndex].name1,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Flying Bubble',
                        fontStyle: FontStyle.italic,
                        height: 2,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      onboarding[currentIndex].name2,
                      style: const TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Bitshow',
                        height: 1,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 70),
                    if (currentIndex == 0)
                      const Text(
                        "Skip the hassle! Embrace the adventure. \nPlan your Nepal trip with us",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 3, 25, 33),
                          fontFamily: "CheeseOrange-Regular",
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboarding.length,
                      (index) => dotIndicator(index),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        color: Colors.white,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CreateAccountPage(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color.fromARGB(255, 27, 27, 27),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Let's Get Started ✈",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(), 
                                  ),
                                );
                              },
                              child: const Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Already have an account? ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Login",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}