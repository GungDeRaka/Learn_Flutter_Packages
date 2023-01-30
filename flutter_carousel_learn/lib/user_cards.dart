// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.avatar,
    required this.userName,
    required this.userEmail,
  }) : super(key: key);
  final String avatar;
  final String userName;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      height: size.height/2,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 3,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: size.width * 0.12,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: size.width * 0.11,
              backgroundImage: NetworkImage(
                avatar,
              ),
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          Text(
            userName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            userEmail,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black45,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          // const SizedBox(
          // height: 24.0,
          // ),
        ],
      ),
    );
  }
}
