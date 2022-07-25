import 'package:flutter/material.dart';

import '../../../model/usermodel2.dart';


class UserItem extends StatelessWidget {
  final Usermodel user;
  const UserItem({Key? key,required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        children: [
          Text(user.username!),
          Text(user.email!),
          Text(user.city!)
        ],
      ),
    );
  }
}
