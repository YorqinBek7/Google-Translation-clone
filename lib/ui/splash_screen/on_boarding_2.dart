import 'package:flutter/material.dart';

class OnBoardingSecond extends StatelessWidget {
  const OnBoardingSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Spacer(),
          Text(
            'Different languages',
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Common communication',
            style: Theme.of(context).textTheme.headline1,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
