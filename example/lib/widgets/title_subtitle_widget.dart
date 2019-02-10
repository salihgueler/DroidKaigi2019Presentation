import 'package:example_flutter/styles.dart';
import 'package:flutter/material.dart';

class TitleSubtitleWidget extends StatelessWidget {
  List<String> subtitleElements;
  String titleText;

  TitleSubtitleWidget({this.titleText, this.subtitleElements = const []});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _createViews(),
      ),
    );
  }

  List<Widget> _createViews() {
    List<Widget> widgets = [];

    widgets.add(Text(
      titleText,
      style: mediumTitleStyle,
    ));

    subtitleElements.forEach((title) {
      widgets.add(
        Padding(
          padding: EdgeInsets.only(top: 32.0),
          child: Text(
            '- $title',
            style: smallTitleStyle,
          ),
        ),
      );
    });

    return widgets;
  }
}
