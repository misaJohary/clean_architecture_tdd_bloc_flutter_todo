import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/toast/failure_toast_widget.dart';
import '../widgets/toast/success_toast_widget.dart';

FToast initToast(BuildContext context) {
  final FToast fToast = FToast();
  fToast.init(context);
  return fToast;
}

void successMessage(BuildContext context, String message) {
  final fToast = initToast(context);

  fToast.showToast(
    child: SuccessToastWidget(
      message: message,
    ),
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}

void failureMessage(BuildContext context, String message) {
  final fToast = initToast(context);

  fToast.showToast(
    child: FailureToastWidget(
      message: message,
    ),
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}
