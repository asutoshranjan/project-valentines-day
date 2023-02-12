import 'package:flutter/material.dart';
import 'package:project_valentines_day/model/member.dart';
import 'package:project_valentines_day/themes/colors.dart';

class Leaders extends StatefulWidget {
  const Leaders({Key? key}) : super(key: key);

  @override
  State<Leaders> createState() => _LeadersState();
}

class _LeadersState extends State<Leaders> {
  List<Members> leads = [
    Members(
        name: "Pikape",
        role: "lead",
        imagenum: 5,
        allowance: 56.894,
        address: "0x17F6AD8Ef98229757"),
    Members(
        name: "Mayami",
        role: "lead",
        imagenum: 1,
        allowance: 26.978,
        address: "0x0x0A098Eda01Ce92ff"),
    Members(
        name: "Foxcon",
        role: "chief",
        imagenum: 3,
        allowance: 24.5694,
        address: "0x0x03C6FcED478cBbC9"),
    Members(
        name: "Megma",
        role: "chief",
        imagenum: 2,
        allowance: 38.6980,
        address: "0xa4FAB34eF9f40767739D1Ff7"),
    Members(
        name: "Monika",
        role: "lead",
        imagenum: 3,
        allowance: 26.998,
        address: "0xffueufegnioeo"),
    Members(
        name: "Potosh",
        role: "chief",
        imagenum: 4,
        allowance: 55.67,
        address: "0xffueufegnioeo"),
    Members(
        name: "Somawa",
        role: "lead",
        imagenum: 1,
        allowance: 56.9073,
        address: "0x0xCA35b7d915458E"),
    Members(
        name: "Renkol",
        role: "chief",
        imagenum: 3,
        allowance: 32.947,
        address: "0xF540aDe6068dFe2F"),
  ];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: leads.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              tileColor: AppColors.lightBlue,
              leading: Container(
                width: 60,
                height: 60,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(
                  'assets/images/Account${leads[index].imagenum}.gif',
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(leads[index].name),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Role: ${leads[index].role}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: AppColors.deepBlue, fontSize: 16),
                  ),
                  Text(
                    'BAL: ${leads[index].allowance} ETH',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.pink[100], fontSize: 15.4),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
