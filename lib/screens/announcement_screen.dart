import 'package:flutter/material.dart';
import 'package:project_valentines_day/themes/colors.dart';

class Announcement extends StatefulWidget {
  const Announcement({Key? key}) : super(key: key);

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: AppColors.lightPurple),
              borderRadius: BorderRadius.circular(20),
            ),
            leading: CircleAvatar(
              backgroundColor: AppColors.lightRed,
              child: Text(
                index.toString(),
                style: TextStyle(color: Colors.black),
              ),
            ),
            trailing: const Text(
              "Date",
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
            title: Text("Announcement $index"),
            subtitle: Text('Item description'),
          );
        });
  }
}
