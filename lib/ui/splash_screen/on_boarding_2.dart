import 'package:flutter/material.dart';
import 'package:gtranslation_clone/utils/colors.dart';

class OnBoardingSecond extends StatelessWidget {
  const OnBoardingSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          Text(
            'Different languages',
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'Common communication',
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.start,
          ),
          const Spacer(),
          Stack(
            children: [
              SizedBox(
                height: 400,
                width: 400,
                child: CustomPaint(
                  painter: BackgroundPainter(),
                ),
              ),
              Positioned(
                left: 50.0,
                top: 40.0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                  width: MediaQuery.of(context).size.width * .5,
                  child: CustomPaint(
                    painter: FirstChatPainter(),
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * .29,
                top: MediaQuery.of(context).size.height * .13,
                child: Text(
                  'Salom',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

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

class FirstChatPainter extends CustomPainter {
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
