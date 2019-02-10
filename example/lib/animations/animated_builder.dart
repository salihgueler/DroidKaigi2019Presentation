import 'package:example_flutter/styles.dart';
import 'package:flutter/material.dart';

///
/// Animated builder example class
///
class AnimatedBuilderExampleWidget extends StatefulWidget {
  @override
  _AnimatedBuilderExampleWidgetState createState() =>
      _AnimatedBuilderExampleWidgetState();
}

class _AnimatedBuilderExampleWidgetState
    extends State<AnimatedBuilderExampleWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _heightAnimation;
  Animation<double> _angleAnimation;
  Animation<double> _marginAnimation;
  Animation<Color> _colorAnimation;
  Animation<Color> _colorDarkAnimation;
  Animation<Color> _colorMediumAnimation;
  Animation<Offset> _slideAnimationLeft;
  Animation<Offset> _slideAnimationRight;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _heightAnimation = Tween(begin: 70.0, end: 45.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 0.25),
      ),
    );
    _angleAnimation = Tween(begin: 0.0, end: 0.25).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.25),
      ),
    );
    _colorAnimation =
        ColorTween(begin: Colors.white, end: flutterLightBlue).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.25, 0.5),
      ),
    );
    _colorMediumAnimation =
        ColorTween(begin: Colors.white, end: flutterMediumBlue).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.25, 0.5),
      ),
    );
    _colorDarkAnimation =
        ColorTween(begin: Colors.white, end: flutterDarkBlue).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.25, 0.5),
      ),
    );
    _marginAnimation = Tween(begin: 0.0, end: 25.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 0.25),
      ),
    );
    _slideAnimationRight =
        Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 0.75),
      ),
    );
    _slideAnimationLeft = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, -1.0)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 0.75),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: <Widget>[
              RotationTransition(
                turns: _angleAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SlideTransition(
                      child: Container(
                        height: _heightAnimation.value,
                        margin: EdgeInsets.only(bottom: _marginAnimation.value),
                        width: 210,
                        color: _colorAnimation.value,
                      ),
                      position: _slideAnimationRight,
                    ),
                    Container(
                      height: _heightAnimation.value,
                      margin: EdgeInsets.only(bottom: _marginAnimation.value),
                      width: 210,
                      color: _colorMediumAnimation.value,
                    ),
                    SlideTransition(
                      child: Container(
                        height: _heightAnimation.value,
                        margin: EdgeInsets.only(bottom: _marginAnimation.value),
                        width: 210,
                        color: _colorDarkAnimation.value,
                      ),
                      position: _slideAnimationLeft,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: RaisedButton(
                  onPressed: () {
                    if (_controller.status == AnimationStatus.completed) {
                      _controller.reverse();
                    } else {
                      _controller.forward();
                    }
                  },
                  child: Text('Start animation!'),
                ),
              )
            ],
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
