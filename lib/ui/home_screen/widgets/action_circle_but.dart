import 'package:flutter/material.dart';
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
      shape: CircleBorder(),
      padding: EdgeInsets.all(padding),
      child: Icon(icon),
    );
  }
}
