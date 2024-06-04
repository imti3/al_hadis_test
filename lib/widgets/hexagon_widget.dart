import 'package:flutter/material.dart';

class HexagonWidget extends StatelessWidget {
  final String code;
  final Color color;
  final double size;

  HexagonWidget({required this.code, required this.color, this.size = 40.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          code,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: size / 2,
          ),
        ),
      ),
    );
  }
}
