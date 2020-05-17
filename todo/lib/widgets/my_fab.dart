import 'package:flutter/material.dart';

class MyFAB extends StatelessWidget {
  final IconData icon;
  const MyFAB(this.icon, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}
