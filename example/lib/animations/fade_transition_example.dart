import 'package:flutter/material.dart';

///
/// Base fade animation example
///
class FadeAnimationExample extends StatefulWidget {
  @override
  _FadeAnimationExampleState createState() => _FadeAnimationExampleState();
}

class _FadeAnimationExampleState extends State<FadeAnimationExample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _controller.value,
      child: GestureDetector(
        child: SizedBox.expand(
          child: FlutterLogo(),
        ),
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
