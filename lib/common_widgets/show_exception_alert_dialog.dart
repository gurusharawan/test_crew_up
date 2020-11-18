import 'package:flutter/material.dart';
import 'package:test_crew_up/common_widgets/show_alert_dialog.dart';

Future<void> showExceptionAlertDialog(
  BuildContext context, {
  @required String title,
  @required dynamic exception,
}) =>
    showAlertDialog(
      context,
      title: title,
      content: _message(exception),
      defaultActionText: 'OK',
    );

String _message(Exception exception) {
  return exception.toString();
}
