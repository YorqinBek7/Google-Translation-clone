import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtranslation_clone/cubits/first_button/first_but_changer_cubit.dart';
import 'package:gtranslation_clone/cubits/second_button/second_button_cubit.dart';
import 'package:gtranslation_clone/ui/route.dart';
import 'package:gtranslation_clone/ui/splash_screen/splash_screen.dart';
import 'package:gtranslation_clone/utils/colors.dart';

void main() {
  runApp(const GTranslationApp());
}

class GTranslationApp extends StatelessWidget {
  const GTranslationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FirstButChangerCubit(),
        ),
        BlocProvider(
          create: (context) => SecondButtonCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Google Translate Clone',
        theme: _lightTheme(),
        onGenerateRoute: OnGenareteRoute.INSTANCE.generateRoute,
        home: const SplashScreen(),
      ),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
      primaryColor: GTranslationColors.mainColor,
      scaffoldBackgroundColor: GTranslationColors.mainColor,
      appBarTheme: const AppBarTheme(
        color: GTranslationColors.mainColor,
        elevation: 0.0,
        toolbarHeight: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: GTranslationColors.mainColor,
          systemNavigationBarColor: GTranslationColors.mainColor,
        ),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.w500,
          color: GTranslationColors.white,
        ),
        headline2: TextStyle(
          color: GTranslationColors.white,
          fontSize: 32.0,
          fontWeight: FontWeight.w600,
          fontFamily: 'SFPro',
        ),
        headline3: TextStyle(
          color: GTranslationColors.C_98A8BA,
          fontSize: 24.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
