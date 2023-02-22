import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gtranslation_clone/utils/colors.dart';

class ChangeLanButton extends StatelessWidget {
  const ChangeLanButton({
    Key? key,
    required this.textStyle,
    required this.textButon,
    required this.onTap,
  }) : super(key: key);

  final TextTheme textStyle;
  final String textButon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        backgroundColor: GTranslationColors.C_C3D3E5,
        textStyle: textStyle.headline3!.copyWith(
          color: GTranslationColors.black,
          fontSize: 18.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20.0.w,
          vertical: 10.0.h,
        ),
      ),
      onPressed: onTap,
      child: Text(textButon),
    );
  }
}
