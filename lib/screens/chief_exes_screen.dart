import 'package:flutter/material.dart';
import 'package:project_valentines_day/model/member.dart';
import 'package:project_valentines_day/themes/colors.dart';

class ChiefExes extends StatefulWidget {
  const ChiefExes({Key? key}) : super(key: key);

  @override
  State<ChiefExes> createState() => _ChiefExesState();
}

class _ChiefExesState extends State<ChiefExes> {
  List<Members> chiefs = [
    Members(
        name: "Pegasus",
        role: "admin",
        imagenum: 1,
        allowance: 460.000,
        address: "0x5B38Da6a701c56854"),
    Members(
        name: "Foxcon",
        role: "chief",
        imagenum: 3,
        allowance: 24.5694,
        address: "0xffueufegnioeo"),
    Members(
        name: "Megma",
        role: "chief",
        imagenum: 2,
        allowance: 38.6980,
        address: "0x0x4B20993Bc48117"),
    Members(
        name: "Potosh",
        role: "chief",
        imagenum: 4,
        allowance: 55.67,
        address: "0x7ec7E8f571ceCaE8A9e2"),
    Members(
        name: "Renkol",
        role: "chief",
        imagenum: 3,
        allowance: 32.947,
        address: "0x0x17F6AD8Ef98229757"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: chiefs.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              tileColor: chiefs[index].role == "admin"
                  ? AppColors.orange
                  : AppColors.lightRed,
              leading: Container(
                width: 60,
                height: 60,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(
                  'assets/images/Account${chiefs[index].imagenum}.gif',
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(chiefs[index].name),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Role: ${chiefs[index].role}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: AppColors.deepBlue, fontSize: 16),
                  ),

                  Text('BAL: ${chiefs[index].allowance} ETH',
                    style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.deepPurple, fontSize: 15.4),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
