import 'package:flutter/material.dart';
import 'package:gtranslation_clone/utils/icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, '/on_boarding_first'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Image.asset(
            GTranslationIcons.logo,
            height: 105.0,
            width: 105.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Google Translate',
            style: Theme.of(context).textTheme.headline2,
          ),
          const Spacer(),
          Stack(
            children: [
              Positioned(
                bottom: 0.0,
                child: Image.asset(
                  GTranslationIcons.splashFirstObj,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  GTranslationIcons.splashSecondObj,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
