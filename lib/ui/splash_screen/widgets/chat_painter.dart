import 'package:flutter/widgets.dart';
import 'package:gtranslation_clone/utils/colors.dart';

class ChatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill
      ..color = GTranslationColors.C_164D8D;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(size.width * .5, size.height * .5),
          width: size.width * .55,
          height: size.height * .4,
        ),
        const Radius.circular(10.0),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
