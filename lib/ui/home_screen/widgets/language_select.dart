import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtranslation_clone/cubits/first_button/first_but_changer_cubit.dart';
import 'package:gtranslation_clone/cubits/second_button/second_button_cubit.dart';
import 'package:gtranslation_clone/utils/colors.dart';
import 'package:gtranslation_clone/utils/helper.dart';

class LanguagesToSelect extends StatelessWidget {
  const LanguagesToSelect({
    Key? key,
    required this.language,
    required this.isLast,
    required this.code,
  }) : super(key: key);
  final String language;
  final bool isLast;
  final String code;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: GTranslationColors.white,
      child: Column(
        children: [
          ListTile(
            onTap: () {
              if (Helper.whichButtonTapped == 1) {
                context
                    .read<FirstButChangerCubit>()
                    .tryToChangeLan(lan: language, code: code);
              } else {
                context
                    .read<SecondButtonCubit>()
                    .tryToChangeLan(lan: language, code: code);
              }

              Navigator.pop(context);
            },
            title: Text(language),
          ),
          if (!isLast) const Divider()
        ],
      ),
    );
  }
}
