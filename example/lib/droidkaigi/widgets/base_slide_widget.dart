import 'package:example_flutter/droidkaigi/styles.dart';
import 'package:flutter/material.dart';

///
/// Base widget for showing the slide view.
///
class BaseSlideWidget extends StatelessWidget {

  /// Main content to be shown on the screen
  Widget mainContentWidget;
  /// background color of the screen
  Color backgroundColor;

  BaseSlideWidget({this.mainContentWidget, this.backgroundColor = mainBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: <Widget>[
          Expanded(child: mainContentWidget),
          Container(
            padding: EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  '08.02.2019',
                  style: bottomBarTextStyle,
                ),
                Text(
                  'DroidKaigi 2019',
                  style: bottomBarTextStyle,
                ),
                Text(
                  '@salihgueler',
                  style: bottomBarTextStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
