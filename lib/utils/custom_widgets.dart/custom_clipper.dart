import 'package:flutter/material.dart';

class RoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from top-left corner
    path.moveTo(0, 0);
    
    // Line to top-right corner
    path.lineTo(size.width, 0);

    // Line to bottom-right corner before the curve
    path.lineTo(size.width, size.height - 30);
    
    // Bottom-right curve
    path.quadraticBezierTo(
      size.width, size.height, // Control point
      size.width - 30, size.height, // End point
    );

    // Line to bottom-left curve
    path.lineTo(30, size.height);

    // Bottom-left curve
    path.quadraticBezierTo(
      0, size.height, // Control point
      0, size.height - 30, // End point
    );

    // Line to top-left corner
    path.lineTo(0, 0);
    
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
