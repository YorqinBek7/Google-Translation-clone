import 'package:flutter/material.dart';
import 'package:gtranslation_clone/ui/splash_screen/widgets/background_paint.dart';
import 'package:gtranslation_clone/ui/splash_screen/widgets/chat_painter.dart';
import 'package:gtranslation_clone/utils/colors.dart';

class OnBoardingSecond extends StatefulWidget {
  const OnBoardingSecond({super.key});

  @override
  State<OnBoardingSecond> createState() => _OnBoardingSecondState();
}

class _OnBoardingSecondState extends State<OnBoardingSecond> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    await Future.delayed(const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, '/on_boarding_third'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Spacer(flex: 2),
          Text(
            'Different languages',
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: GTranslationColors.white,
                  fontWeight: FontWeight.w300,
                ),
          ),
          Text(
            'common communication',
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
                    painter: ChatPainter(),
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
              Positioned(
                left: 200.0,
                top: 150.0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                  width: MediaQuery.of(context).size.width * .5,
                  child: CustomPaint(
                    painter: ChatPainter(),
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * .69,
                top: MediaQuery.of(context).size.height * .27,
                child: Text(
                  'Hello',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
