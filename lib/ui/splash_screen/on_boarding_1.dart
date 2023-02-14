import 'package:flutter/material.dart';
import 'package:gtranslation_clone/utils/colors.dart';
import 'package:gtranslation_clone/utils/icons.dart';

class OnBoardingFirst extends StatefulWidget {
  const OnBoardingFirst({super.key});

  @override
  State<OnBoardingFirst> createState() => _OnBoardingFirstState();
}

class _OnBoardingFirstState extends State<OnBoardingFirst>
    with TickerProviderStateMixin {
  late AnimationController _firstAnimationController;
  late AnimationController _secondAnimationController;
  Animation<RelativeRect>? _secondAnimation;
  late Animation<RelativeRect> _thirdAnimation;
  late AnimationController _thirdWordController;

  @override
  void initState() {
    super.initState();
    _firstAnimationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _secondAnimationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _thirdWordController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _firstWord();
    _init();
  }

  _init() async {
    await Future.delayed(const Duration(seconds: 4),
        () => Navigator.pushReplacementNamed(context, '/on_boarding_second'));
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'Google',
                  style: textStyle.headline3!.copyWith(
                    fontSize: 16.0,
                    color: GTranslationColors.C_E5E5E5,
                  ),
                ),
                Text(
                  'Welcome Translate',
                  style: textStyle.headline2,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Spacer(),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  GTranslationIcons.women,
                ),
              ),
              Positioned(
                left: 190.0,
                top: 250.0,
                right: 40.0,
                bottom: 0.0,
                child: Opacity(
                  opacity: _thirdWordController.value,
                  child: Text(
                    'Hello',
                    style: textStyle.headline3,
                    maxLines: 1,
                  ),
                ),
              ),
              PositionedTransition(
                rect: _secondAnimation ??
                    RelativeRectTween(
                      begin:
                          const RelativeRect.fromLTRB(200.0, 250.0, 40.0, 0.0),
                      end: const RelativeRect.fromLTRB(200.0, 250.0, 40.0, 0.0),
                    ).animate(_firstAnimationController),
                child: Opacity(
                  opacity: _secondAnimationController.value,
                  child: Text(
                    'Salom',
                    style: textStyle.headline3,
                    maxLines: 1,
                  ),
                ),
              ),
              PositionedTransition(
                rect: _thirdAnimation,
                child: Opacity(
                  opacity: _firstAnimationController.value,
                  child: Text(
                    'Merhaba',
                    style: textStyle.headline3,
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _firstWord() async {
    _thirdAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(200.0, 250.0, 40.0, 0.0),
      end: const RelativeRect.fromLTRB(230.0, 200.0, 60.0, 100.0),
    ).animate(_firstAnimationController)
      ..addListener(() {
        setState(() {
          if (_thirdAnimation.status == AnimationStatus.completed) {
            _thirdAnimation = RelativeRectTween(
              begin: const RelativeRect.fromLTRB(230.0, 200.0, 60.0, 100.0),
              end: const RelativeRect.fromLTRB(180.0, 140.0, 40.0, 200.0),
            ).animate(_secondAnimationController)
              ..addListener(() {
                setState(() {});
              });
            _secondAnimationController.forward();
            _secondWord();
          }
        });
      });
    _firstAnimationController.forward();
  }

  _secondWord() async {
    _secondAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(200.0, 250.0, 40.0, 0.0),
      end: const RelativeRect.fromLTRB(230.0, 200.0, 60.0, 100.0),
    ).animate(_secondAnimationController)
      ..addListener(() {
        setState(() {});
      });
    _secondAnimationController.forward();
    await Future.delayed(const Duration(seconds: 1), () {
      _thirdWordController.addListener(() {
        setState(() {});
      });
      _thirdWordController.forward();
    });
  }

  @override
  void dispose() {
    _firstAnimationController.dispose();
    _secondAnimationController.dispose();
    _thirdWordController.dispose();
    super.dispose();
  }
}
