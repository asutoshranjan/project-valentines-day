import 'package:flutter/material.dart';
import 'package:project_valentines_day/screens/home_screen.dart';
import 'package:project_valentines_day/themes/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff243853),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/loading.gif',
            fit: BoxFit.fitWidth,
          ),
          Center(
            child: SizedBox(
              width: 0.17 * screenWidth,
              height: 0.17 * screenWidth,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 0.08 * screenWidth),
          Center(
            child: Text(
              'Digital Wallet',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: AppColors.lightPurple, letterSpacing: 1.2),
            ),
          ),
          SizedBox(height: 0.22 * screenWidth),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightBlue,
                elevation: 1,
                shape: const StadiumBorder(),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                child: Text(
                  "Continue",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: AppColors.white, letterSpacing: 1.2),
                ),
              )),
          SizedBox(height: 0.2 * screenWidth),
          Text(
            'The Next Gen Organizations Digital Wallet',
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontSize: 12.5, color: AppColors.white, letterSpacing: 1.2),
          ),
        ],
      ),
    );
  }
}
