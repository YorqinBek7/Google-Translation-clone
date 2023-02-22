import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gtranslation_clone/utils/colors.dart';
import 'package:gtranslation_clone/utils/icons.dart';

class OnBoardingThird extends StatefulWidget {
  const OnBoardingThird({super.key});

  @override
  State<OnBoardingThird> createState() => _OnBoardingThirdState();
}

class _OnBoardingThirdState extends State<OnBoardingThird> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    GetStorage().write('isFirstTime', false);
    await Future.delayed(const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, '/home_screen'));
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.headline3!;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Spacer(),
          Text(
            'Translate',
            style: textStyle.copyWith(
                color: GTranslationColors.white, fontWeight: FontWeight.w300),
          ),
          Text(
            'Anywhere, Anytime',
            style: textStyle.copyWith(color: GTranslationColors.white),
          ),
          SizedBox(
            height: 40.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              GTranslationIcons.thirdOnBoarding,
              width: 337.27,
              height: 135.0,
              fit: BoxFit.cover,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
