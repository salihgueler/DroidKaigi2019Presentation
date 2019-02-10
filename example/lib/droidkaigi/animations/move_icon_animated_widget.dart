import 'package:flutter/material.dart';

///
/// Widget to animate a flutter icon with buttons
///
class MoveIconAnimatedWidget extends StatefulWidget {
  @override
  _MoveIconAnimatedWidgetState createState() => _MoveIconAnimatedWidgetState();
}

class _MoveIconAnimatedWidgetState extends State<MoveIconAnimatedWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animationToBottom;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animationToBottom =
        Tween(begin: Offset(0.0, -1.0), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SlideTransition(
          position: _animationToBottom,
          child: SizedBox.expand(
            child: FlutterLogo(),
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          child: IconButton(
            iconSize: 48,
            color: Colors.white,
            onPressed: () {
              _controller.reverse();
            },
            icon: Icon(Icons.arrow_upward),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: IconButton(
            iconSize: 48,
            color: Colors.white,
            onPressed: () {
              _controller.forward();
            },
            icon: Icon(Icons.arrow_downward),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
