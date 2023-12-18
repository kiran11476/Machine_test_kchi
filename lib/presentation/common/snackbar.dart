import 'package:flutter/material.dart';

import '../../main.dart';

Future<void> showSnackBar(
    {String message = 'Alert', String buttonText = 'Close'}) async {
  ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(message),
      margin: const EdgeInsets.all(8),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: buttonText,
        onPressed: () {
          ScaffoldMessenger.of(navigatorKey.currentContext!)
              .removeCurrentSnackBar();
        },
      ),
    ),
  );
}
