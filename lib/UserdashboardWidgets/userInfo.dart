import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../functions/StringProcess.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello ${user!.displayName}',
              style: TextStyle(
                color: Color(0xff969191),
                fontFamily: 'Arial',
                fontSize: 22,
              ),
            ),
            Text(
              'You have got',
              style: TextStyle(
                color: Color(0xff000000),
                fontFamily: 'Arial',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '0 tasks',
              style: TextStyle(
                color: Color(0xff3BC16D),
                fontFamily: 'Arial',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(right: 38),
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(user.photoURL!),
                  maxRadius: 30,
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  StringProcess.stringProcess(user.uid),
                  style: TextStyle(
                    color: Color(0xff5670F0),
                    fontFamily: 'Arial',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
