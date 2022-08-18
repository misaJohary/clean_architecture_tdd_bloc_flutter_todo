import 'package:flutter/material.dart';

import 'base_toast_widget.dart';

class FailureToastWidget extends StatelessWidget {
  const FailureToastWidget({
    Key? key,
    required this.message,
  }) : super(key: key);
  final String? message;
  @override
  Widget build(BuildContext context) {
    return BaseToastWidget(
      color: Colors.redAccent,
      icon: Icons.cancel_outlined,
      message: message ?? 'Failure',
    );
  }
}
