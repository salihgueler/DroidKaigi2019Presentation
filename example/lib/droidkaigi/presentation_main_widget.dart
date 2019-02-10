import 'package:example_flutter/droidkaigi/slide_page_view.dart';
import 'package:flutter/material.dart';

///
/// Entry point to the presentation
///
class PresentationMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SlidePageView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
    );
  }
}
