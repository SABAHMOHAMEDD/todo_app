import 'package:flutter/material.dart';

void showMessage(context, String message,
    {String? positiveActionName,
    VoidCallback? posAction,
    String? negativeActionName,
    VoidCallback? negAction,
    bool isCancelabele = true}) {
  List<Widget> actions = [];
  if (positiveActionName != null) {
    actions.add(TextButton(
      child: Text(positiveActionName),
      onPressed: () {
        Navigator.pop(context); // close the message
        if (posAction != null) {
          posAction(); // func will exceute after pressing the postive bottom
        }
      },
    ));
  }
  if (negativeActionName != null) {
    actions.add(TextButton(
      child: Text(
        negativeActionName,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Theme.of(context).primaryColor),
      ),
      onPressed: () {
        Navigator.pop(context); // close the message
        if (negAction != null) {
          negAction(); // func will exceute after pressing the negative bottom
        }
      },
    ));
  }
  showDialog(
      context: context,
      builder: (buildcontext) {
        return AlertDialog(
          content: Text(
            message,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.normal),
          ),
          actions: actions,
        );
      },
      barrierDismissible: isCancelabele);
}

void showLoading(context, String loadingMessage, {bool isCancelabele = true}) {
  showDialog(
      context: context,
      builder: (buildcontext) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 12,
              ),
              Text(loadingMessage),
            ],
          ),
        );
      },
      barrierDismissible: isCancelabele);
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}
