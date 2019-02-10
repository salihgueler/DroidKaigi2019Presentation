import 'package:example_flutter/styles.dart';
import 'package:flutter/material.dart';

class BaseSlideWidget extends StatelessWidget {
  Widget mainContentWidget;
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
