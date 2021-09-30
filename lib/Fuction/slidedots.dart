import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  final bool isActive;
  SlideDots(this.isActive);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 15 : 8,
      width: isActive ? 15 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
          color: isActive ? Colors.blue : Colors.grey,
         ),
    );
  }
}
