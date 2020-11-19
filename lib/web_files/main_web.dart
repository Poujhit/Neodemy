import 'package:flutter/material.dart';

import 'web_screen/first_screen_web.dart';

class WebMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}
