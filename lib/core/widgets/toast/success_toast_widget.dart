import 'package:flutter/material.dart';

import 'base_toast_widget.dart';

class SuccessToastWidget extends StatelessWidget {
  final String? message;
  const SuccessToastWidget({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseToastWidget(
      color: Colors.greenAccent,
      icon: Icons.check,
      message: message ?? 'Success',
    );
  }
}
