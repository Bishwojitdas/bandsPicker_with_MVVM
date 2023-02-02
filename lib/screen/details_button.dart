import 'package:flutter/material.dart';

import '../utils/custom_font.dart';

class DetialsButton extends StatelessWidget {
  final IconData icon;
  final String title;
  DetialsButton({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Icon(icon, color: Colors.red, size: 20),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style:
            LatoRegular.copyWith(fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ],
      ),
    );
  }
}