import 'package:example_flutter/styles.dart';
import 'package:flutter/material.dart';

class IntroSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Animations in Flutter',
              style: mediumTitleStyle,
            ),
            Text(
              'Muhammed Salih Güler',
              style: smallTitleStyle,
            ),
            Image.asset('assets/images/karlmax.png', width: 300,)
          ],
        ),
      ),
    );
  }
}
