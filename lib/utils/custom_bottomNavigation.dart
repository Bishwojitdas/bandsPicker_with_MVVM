import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelect;

  late Function() onTap;


  BottomNavItem({required this.icon, required this.isSelect, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: InkWell(
      onTap: (){
        onTap();
      },
      child: Icon(icon, color: Colors.white,),
    ));
  }
}
