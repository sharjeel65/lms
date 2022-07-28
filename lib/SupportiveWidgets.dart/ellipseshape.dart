import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.630000114440918;
    paint0.shader = ui.Gradient.linear(
        Offset(size.width * 0.21, size.height * 0.81),
        Offset(size.width, size.height),
        [Color(0xffd61ff5), Color(0xff7481d5)],
        [0.00, 1.00]);

    Path path0 = Path();
    path0.moveTo(size.width * 0.2079000, size.height);
    path0.quadraticBezierTo(size.width * 0.2567500, size.height * 0.9757167,
        size.width * 0.3762500, size.height * 0.9462333);
    path0.cubicTo(
        size.width * 0.6400500,
        size.height * 0.9365500,
        size.width * 0.5555500,
        size.height * 0.8248500,
        size.width * 0.6652500,
        size.height * 0.8181333);
    path0.cubicTo(
        size.width * 0.7873000,
        size.height * 0.8144167,
        size.width * 0.7422000,
        size.height * 0.7912333,
        size.width * 0.8038000,
        size.height * 0.7558500);
    path0.cubicTo(
        size.width * 0.8638500,
        size.height * 0.7184167,
        size.width * 0.9168500,
        size.height * 0.7012333,
        size.width,
        size.height * 0.6105167);
    path0.quadraticBezierTo(
        size.width, size.height * 0.7078875, size.width, size.height);
    path0.lineTo(size.width * 0.2079000, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
