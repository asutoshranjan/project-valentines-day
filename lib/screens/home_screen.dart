
import 'package:flutter/material.dart';
import 'package:project_valentines_day/screens/all_transactions_screen.dart';
import 'package:project_valentines_day/screens/chief_exes_screen.dart';
import 'package:project_valentines_day/screens/leaders_acreen.dart';
import 'package:project_valentines_day/screens/voting_screen.dart';
import 'package:project_valentines_day/themes/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentAccount = 1;


  void _showPopupMenu() async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 10, 100),
      items: [
        PopupMenuItem(value: 1, child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.asset(
                'assets/images/Account1.gif',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 5,),
            Text("Pegasus: Admin"),
          ],
        )),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Image.asset(
                  'assets/images/Account2.gif',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 5,),
              Text("Foxcon: Chief"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Image.asset(
                  'assets/images/Account3.gif',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 5,),
              Text("Pramod: Guest"),
            ],
          ),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) {
        setState(() {
          currentAccount = value;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              'NGO Wallet',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: AppColors.lightPurple,
                    fontSize: 34,
                  ),
            ),
          ),
          bottom: TabBar(
            physics: const BouncingScrollPhysics(),
            isScrollable: true,
            tabs: [
              Tab(
                child: Text(
                  "All Transactions",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: AppColors.teal, fontSize: 18),
                ),
              ),
              Tab(
                child: Text(
                  "Chief Executives",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: AppColors.teal, fontSize: 18),
                ),
              ),
              Tab(
                child: Text(
                  "Leaders",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: AppColors.teal, fontSize: 18),
                ),
              ),
              Tab(
                child: Text(
                  "Voting",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: AppColors.teal, fontSize: 18),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: GestureDetector(
                onTap: () {
                  _showPopupMenu();
                },
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(
                    "assets/images/Account${currentAccount}.gif",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        body:  TabBarView(
          children: [
            AllTransactions(),
            ChiefExes(),
            Leaders(),
            VotingFeature(account: currentAccount,),
          ],
        ),
      ),
    );
  }
}
