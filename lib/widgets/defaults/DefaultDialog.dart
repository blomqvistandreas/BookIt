import 'package:flutter/material.dart';

Future createDefaultDialog(
  BuildContext context,
  Widget content,
) {
  return showGeneralDialog(
    useRootNavigator: true,
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder:
        (BuildContext context, Animation animation, Animation secondAnimation) {
      return Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: content,
        ),
      );
    },
  );
}
