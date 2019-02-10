import 'package:flutter/physics.dart';
import 'package:flutter/material.dart';

///
/// Example to show gravity behaviour by newton's law of physics
///
class GravityExample extends StatefulWidget {
  @override
  _GravityExampleState createState() => _GravityExampleState();
}

class _GravityExampleState extends State<GravityExample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Transform(
              transform: Matrix4.translationValues(0.0, _controller.value, 0.0),
              child: Container(
                width: 200,
                height: 200,
                child: FlutterLogo(),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: RaisedButton(
              onPressed: () {
                _controller.animateWith(GravitySimulation(
                  10.0, // acceleration, pixels per second
                  0.0, // starting position, pixels
                  300.0, // ending position, pixels
                  0.0, // starting velocity, pixels per second
                ));
              },
              child: Text('Start simulation'),
            ),
          ),
        ]);
      },
    );
  }
}
