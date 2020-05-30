import 'package:flutter/material.dart';

Future createDefaultModal(
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
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, right: 20),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.close),
                        ),
                      ),
                    ),
                    content
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
