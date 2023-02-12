import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:project_valentines_day/themes/colors.dart';

class AllTransactions extends StatefulWidget {
  const AllTransactions({Key? key}) : super(key: key);

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {
  List<int> sent = [
    0,
    4,
    7,
    13,
    14,
    18,
    20,
    21,
    22,
    26,
    27,
    30,
    31,
    34,
    36,
    37
  ];

  List<int> random = [0, 7, 13, 14, 20, 21, 27, 34, 36, 37];

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        reverse: true,
        itemCount: 37,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              tileColor: AppColors.purple,
              leading: Container(
                width: 50,
                height: 50,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Image.asset(
                  sent.contains(index)
                      ? random.contains(index)
                          ? 'assets/images/transaction1.png'
                          : 'assets/images/transaction2.png'
                      : 'assets/images/transaction3.png',
                  fit: BoxFit.cover,
                ),
              ),
              trailing: Icon(
                sent.contains(index) ? Icons.arrow_forward : Icons.arrow_back,
                color:
                    sent.contains(index) ? Colors.red[800] : Color(0xff6ae792),
                size: 30,
              ),
              title: Text(
                "Transaction #${index + 1}",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              subtitle: Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      sent.contains(index)
                          ? 'To: 0x${getRandomString(16)}'
                          : 'From: 0x${getRandomString(15)}',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
