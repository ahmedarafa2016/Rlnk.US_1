import 'package:flutter/material.dart';
import 'package:rlnk_1/pallete.dart';

class CustomKeyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const CustomKeyTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: constraints.maxWidth * .9,
          maxHeight: constraints.maxHeight * .2,
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Pallete.borderColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Pallete.gradient2,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
            suffixIcon: IconButton(
              icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                //  obscureText ? Icons.visibility : Icons.obscureText;
              },
            ),
          ),
        ),
      );
    });
  }
}
