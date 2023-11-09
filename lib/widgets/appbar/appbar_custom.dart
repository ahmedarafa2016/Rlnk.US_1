import 'package:flutter/material.dart';

import '../gradientrlnk.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        automaticallyImplyLeading: true,
        title: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Rlnk.Us',
                style: TextStyle(
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
