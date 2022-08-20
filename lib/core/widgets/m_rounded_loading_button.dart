import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../theme/theme.dart';

class MRoundedLoadingButton extends StatelessWidget {
  final RoundedLoadingButtonController controller;
  final VoidCallback onPressed;
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  final Color? spinColor;
  final double? elevation;
  final bool animateOnTap;

  const MRoundedLoadingButton({
    Key? key,
    required this.controller,
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
    this.color,
    this.spinColor,
    this.elevation,
  })  : animateOnTap = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      width: width ?? double.infinity,
      height: height ?? 50,
      color: color ?? Colors.white,
      disabledColor: Colors.white,
      valueColor: spinColor ?? mColor,
      elevation: elevation ?? 2,
      controller: controller,
      onPressed: onPressed,
      animateOnTap: animateOnTap,
      child: child,
    );
  }
}
