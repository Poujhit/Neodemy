import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Welcome!!',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
