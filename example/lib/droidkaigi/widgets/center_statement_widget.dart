import 'package:example_flutter/droidkaigi/styles.dart';
import 'package:flutter/material.dart';

///
/// Widget to show a big statement on the center of the screen
///
class CenterStatementWidget extends StatelessWidget {
  String statement;

  CenterStatementWidget(this.statement);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      alignment: Alignment.center,
      child: Text(
        statement,
        style: largeTitleStyle,
      ),
    );
  }
}
