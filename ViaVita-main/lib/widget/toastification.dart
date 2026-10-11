import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:workers_app/colors/colors.dart';

class ToastManager {
  static ToastificationItem? _current;
  static void showSingle(
    BuildContext context, {
    required String title,
    ToastificationType type = ToastificationType.info,
    ToastificationStyle style = ToastificationStyle.flat,
    Color? textcolor,
    int duration = 3,
    Function(ToastificationItem)? onTap,
  }) {
    if (_current != null) {
      Toastification().dismiss(_current!, showRemoveAnimation: false);
      _current = null;
    } else {
      Toastification().dismissAll(delayForAnimation: false);
    }
    _current = Toastification().show(
      style: style,
      backgroundColor: colors.container_color,
      context: context,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      type: type,
      alignment: Alignment.topCenter,
      autoCloseDuration: Duration(seconds: duration),
      callbacks: ToastificationCallbacks(onTap: onTap),
    );
  }
}