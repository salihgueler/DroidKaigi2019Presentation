// Copyright 2018 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:example_flutter/animations/animated_builder.dart';
import 'package:example_flutter/animations/fade_animation_animated_widget.dart';
import 'package:example_flutter/animations/fade_transition_example.dart';
import 'package:example_flutter/animations/gravity_example.dart';
import 'package:example_flutter/animations/move_icon_animated_widget.dart';
import 'package:example_flutter/flutter-animations/lib/main.dart';
import 'package:example_flutter/styles.dart';
import 'package:example_flutter/widgets/base_slide_widget.dart';
import 'package:example_flutter/widgets/center_statement_widget.dart';
import 'package:example_flutter/widgets/intro_slide.dart';
import 'package:example_flutter/widgets/title_subtitle_widget.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart' show FlareActor;

void main() {
  // Desktop platforms are not recognized as valid targets by
  // Flutter; force a specific target to prevent exceptions.
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(
    MaterialApp(
      home: SlidePageView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
    ),
  );
}

///
/// Main Slide Widget
///
class SlidePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          BaseSlideWidget(
            mainContentWidget: IntroSlide(),
          ),
          BaseSlideWidget(
            mainContentWidget: CenterStatementWidget('What is Flutter?'),
          ),
          BaseSlideWidget(
            mainContentWidget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  'assets/reflectly.gif',
                  width: 350,
                ),
                Image.asset(
                  'assets/history.gif',
                  width: 350,
                ),
                Image.asset(
                  'assets/flutter_gallery.gif',
                  width: 350,
                ),
              ],
            ),
          ),
          BaseSlideWidget(
            mainContentWidget:
                CenterStatementWidget('Why animations are important?'),
          ),
          BaseSlideWidget(
            mainContentWidget: CenterStatementWidget('Animations in Flutter'),
          ),
          BaseSlideWidget(
            mainContentWidget: TitleSubtitleWidget(
              titleText: 'Animation Types',
              subtitleElements: const [
                'Tween animations',
                'Physics-based animations'
              ],
            ),
          ),
          BaseSlideWidget(
            mainContentWidget: TitleSubtitleWidget(
              titleText: 'Base concepts to create an animation',
            ),
          ),
          BaseSlideWidget(
            mainContentWidget: TitleSubtitleWidget(
              titleText: 'Animation<T>',
              subtitleElements: const [
                'The primary building block of the animation system is the Animation class.',
                'Animation object knows nothing about what is onscreen. An Animation is an abstract class that understands its current value and its state (completed or dismissed).'
              ],
            ),
          ),
          BaseSlideWidget(
            mainContentWidget: TitleSubtitleWidget(
              titleText: 'AnimationController',
              subtitleElements: const [
                'As well as being an animation itself, an AnimationController lets you control the animation.',
                'By default, an AnimationController linearly produces the numbers from 0.0 to 1.0 during a given duration.',
                'Once you’ve created an animation controller, you can start building other animations based on it.',
              ],
            ),
          ),
          BaseSlideWidget(
            mainContentWidget: FadeAnimationExample(),
          ),
          BaseSlideWidget(
            mainContentWidget: TitleSubtitleWidget(
              titleText: 'AnimatedWidget',
              subtitleElements: const [
                'The AnimatedWidget base class allows you to separate out the core widget code from the animation code. ',
                'AnimatedWidget doesn’t need to maintain a State object to hold the animation. '
              ],
            ),
          ),
          BaseSlideWidget(
            mainContentWidget:
                SizedBox.expand(child: FadeAnimationAnimatedWidget()),
          ),
          BaseSlideWidget(
            mainContentWidget: TitleSubtitleWidget(
              titleText: 'Tween',
              subtitleElements: const [
                'If you need a different range or a different data type, you can use a Tween to configure an animation to interpolate to a different range or data type.',
                'Interpolates between its begin and end values.',
                'CurveTween, ColorTween, IntTween, RectTween...'
              ],
            ),
          ),
          BaseSlideWidget(
            mainContentWidget: TitleSubtitleWidget(
              titleText: 'Curve',
              subtitleElements: const [
                'Easing curves are used to adjust the rate of change of an animation over time.',
                'It is allowing them to speed up and slow down, rather than moving at a constant rate.'
              ],
            ),
          ),
          BaseSlideWidget(
              mainContentWidget: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset('assets/images/curve_bounce_in.png'),
                  Image.asset('assets/images/curve_bounce_in_out.png'),
                  Image.asset('assets/images/curve_bounce_out.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset('assets/images/curve_decelerate.png'),
                  Image.asset('assets/images/curve_fast_out_slow_in.png'),
                  Image.asset('assets/images/curve_ease_in.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset('assets/images/curve_ease_in_out.png'),
                  Image.asset('assets/images/curve_ease_out.png'),
                  Image.asset('assets/images/curve_elastic_in.png'),
                ],
              ),
            ],
          )),
          BaseSlideWidget(
            mainContentWidget: MoveIconAnimatedWidget(),
          ),
          BaseSlideWidget(
            mainContentWidget: TitleSubtitleWidget(
              titleText: 'AnimatedBuilder',
              subtitleElements: const [
                'AnimatedBuilder is useful for more complex widgets that wish to include an animation as part of a larger build function. ',
                'An AnimatedBuilder doesn’t know how to render the widget, nor does it manage the Animation object.',
                'An AnimatedBuilder understands how to render the transition.',
                'To use AnimatedBuilder, simply construct the widget and pass it a builder function.',
              ],
            ),
          ),
          BaseSlideWidget(
            mainContentWidget: AnimatedBuilderExampleWidget(),
          ),
          BaseSlideWidget(
            mainContentWidget: TitleSubtitleWidget(
              titleText: 'Physics-based animations',
              subtitleElements: const [
                'In physics-based animation, motion is modeled to resemble real-world behavior.',
                'There are simulators that you can use to immitate behaviour. GravitySimulation, SpringSimulation...'
              ],
            ),
          ),
          BaseSlideWidget(
            mainContentWidget: GravityExample(),
          ),
          BaseSlideWidget(
            mainContentWidget: TitleSubtitleWidget(
              titleText: 'Bonus: Flare!',
              subtitleElements: const [
                'Vector design and animation tool',
                'Free to use as part of the Open Design movement. You can create unlimited public files for free.',
                'Flare currently supports exporting for Flutter and for websites.'
              ],
            ),
          ),
          BaseSlideWidget(
            mainContentWidget: SizedBox.expand(
              child: Image.asset('assets/images/flare.png'),
            ),
          ),
          BaseSlideWidget(
            mainContentWidget: FlareActor(
              'flare_animation/droidkaigi.flr',
              animation: 'Demo Mode',
            ),
          ),
          BaseSlideWidget(
            mainContentWidget: CenterStatementWidget('Conclusion'),
          ),
          BaseSlideWidget(
            mainContentWidget: Image.asset('assets/concept.gif'),
          ),
          BaseSlideWidget(
            mainContentWidget: MyApp(),
          ),
          BaseSlideWidget(
            mainContentWidget: TitleSubtitleWidget(
              titleText: 'What to do now?',
              subtitleElements: const [
                'Read the introduction document on flutter.io',
                'Check out the codelab',
                'Check the Flutter Medium page for the animations blog of Mikkel Ravn',
                'Check my blog post :)',
                'Start implementing.'
              ],
            ),
          ),
          BaseSlideWidget(
            mainContentWidget: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Center(
                    child: Text(
                      'Thank you',
                      style: mediumTitleStyle,
                    ),
                  ),
                  Text(
                    'Twitter: @salihgueler',
                    style: smallTitleStyle,
                  ),
                  Text(
                    'GitHub: @salihgueler',
                    style: smallTitleStyle,
                  ),
                  Text(
                    'E-mail: muhammedsalihguler@gmail.com',
                    style: smallTitleStyle,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
