import 'package:flutter/material.dart';
import 'package:searchbar/common/colors.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var paint = Paint();

    var w = size.width;
    var h = size.height;

    // var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    // path.addRect(rect);

    path.moveTo(0, 0);
    path.lineTo(w, 0);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();

    var colors = [MyColors.main, Colors.white, Colors.white];
    var stops = [0 / 2, 1 / 2, 0 / 2];

    Rect rectShape = Rect.fromLTWH(0, 0, size.width, size.height);
    final Gradient gradient = LinearGradient(
        colors: colors,
        stops: stops,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);

    paint = Paint()..shader = gradient.createShader(rectShape);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
