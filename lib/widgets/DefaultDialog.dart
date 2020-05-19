import 'package:flutter/material.dart';

class DefaultDialog extends StatelessWidget {
  const DefaultDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text("3"),
      color: Colors.red,
      onPressed: () {
        showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.black54,
          transitionDuration: const Duration(milliseconds: 700),
          pageBuilder: (BuildContext context, Animation animation,
              Animation secondAnimation) {
            return Center(
              child: Container(
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width - 100,
                color: Colors.blue,
                child: RaisedButton(
                  color: Colors.yellow,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "What do you want?",
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
