import 'package:elearn_app/web_files/web_widgets/body_web.dart';
import 'package:flutter/material.dart';

import '../web_widgets/head_web.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeadWeb(),
            BodyWeb(),
          ],
        ),
      ),
    );
  }
}
