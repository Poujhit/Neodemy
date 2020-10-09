import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  CustomAppBar(this.title);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.27 -
          MediaQuery.of(context).padding.top -
          MediaQuery.of(context).padding.bottom,
      stretch: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: Colors.grey[200],
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          height: MediaQuery.of(context).size.height * 0.11 -
              MediaQuery.of(context).padding.top -
              MediaQuery.of(context).padding.bottom,
          alignment: Alignment.topCenter,
          // color: Colors.green,
          width: MediaQuery.of(context).size.width,
          child: FittedBox(
            child: Container(
              margin: const EdgeInsets.all(3),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
        stretchModes: [
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
      ),
    );
  }
}
