import 'package:flutter/material.dart';

///
/// Fade animation created with Fade transition
///
class FadeAnimationAnimatedWidget extends StatefulWidget {
  @override
  _FadeAnimationAnimatedWidgetState createState() =>
      _FadeAnimationAnimatedWidgetState();
}

class _FadeAnimationAnimatedWidgetState
    extends State<FadeAnimationAnimatedWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: GestureDetector(
        child: FlutterLogo(),
        onTap: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
