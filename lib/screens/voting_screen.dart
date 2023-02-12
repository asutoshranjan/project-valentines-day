import 'package:flutter/material.dart';
import 'package:project_valentines_day/themes/colors.dart';

class VotingFeature extends StatefulWidget {
  final int account;
  const VotingFeature({Key? key, required this.account}) : super(key: key);

  @override
  State<VotingFeature> createState() => _VotingFeatureState();
}

class _VotingFeatureState extends State<VotingFeature> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFDDE6EE),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/vote.gif',
            fit: BoxFit.fitWidth,
          ),

          SizedBox(height: 0.08 * screenWidth),
          widget.account == 3 ? Text("Currently there's no voting rounds going!",style: Theme.of(context).textTheme.subtitle1,) : ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightBlue,
                elevation: 1,
                shape: const StadiumBorder(),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                child: Text(
                  "Start New Poll",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: AppColors.white, letterSpacing: 1.2),
                ),
              )),
        ],
      ),
    );
  }
}
