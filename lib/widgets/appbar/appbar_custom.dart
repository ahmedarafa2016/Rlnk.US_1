// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../gradientrlnk.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String Appheadr;
  const MyAppBar({
    Key? key,
    required this.Appheadr,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        automaticallyImplyLeading: true,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Appheadr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        flexibleSpace: const CradientRlnk(),
        leading: IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset('assets/icons/32.png'),
          ),
        ),
      ),
    );
  }
}
