import 'package:flutter/widgets.dart';
import 'package:gtranslation_clone/utils/colors.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill
      ..color = GTranslationColors.C_378DF1;

    final path = Path();
    path.moveTo(size.width * .6, size.height * .1);

    path.quadraticBezierTo(
        size.width * .2, size.height * .2, size.width * .2, size.height * .35);
    path.quadraticBezierTo(
        size.width * .2, size.height * .4, size.width * .25, size.height * .47);
    path.quadraticBezierTo(size.width * .3, size.height * .55, size.width * .25,
        size.height * .65);
    path.quadraticBezierTo(
        size.width * .15, size.height * .9, size.width * .5, size.height * .7);
    path.quadraticBezierTo(
        size.width * .56, size.height * .66, size.width * .7, size.height * .8);
    path.quadraticBezierTo(
        size.width * .85, size.height * .9, size.width * .87, size.height * .5);
    path.quadraticBezierTo(
        size.width * .8, size.height * .1, size.width * .6, size.height * .1);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
