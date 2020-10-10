import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String title;
  final Function pushViewall;
  final bool isViewall;
  TitleHeader(this.title, this.pushViewall, this.isViewall);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 24),
            child: AutoSizeText(
              title,
              style: Theme.of(context).textTheme.headline1,
              maxLines: 1,
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: pushViewall,
            child: Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 30),
              child: isViewall
                  ? Text(
                      'View all',
                      style: Theme.of(context).textTheme.headline2,
                    )
                  : Text(''),
            ),
          ),
        ),
      ],
    );
  }
}
