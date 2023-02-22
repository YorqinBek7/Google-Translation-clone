import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gtranslation_clone/utils/colors.dart';

class ActionCircleButton extends StatelessWidget {
  const ActionCircleButton({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.padding,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData icon;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      elevation: 0.0,
      fillColor: GTranslationColors.C_C3D3E5,
      shape: const CircleBorder(),
      padding: EdgeInsets.all(padding.h),
      child: Icon(icon),
    );
  }
}
