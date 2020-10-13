import 'package:elearn_app/screens/about_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final String check;
  BottomBar(this.check);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Colors.white,
      elevation: 10,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 25.0),
              child: IconButton(
                iconSize: 30.0,
                icon: Icon(
                  Icons.home_outlined,
                  color: const Color(0xAA1D9398),
                ),
                onPressed: () {
                  if (check != 'home') Navigator.of(context).pop();
                },
                splashRadius: 25,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 25.0),
              child: IconButton(
                icon: Icon(
                  Icons.more_vert_sharp,
                  color: const Color(0xAA1D9398),
                ),
                splashRadius: 25,
                onPressed: () {
                  if (check != 'about' && check != 'home')
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => AboutScreen(),
                      ),
                    );
                  if (check == 'home' && check != 'profile' && check != 'about')
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => AboutScreen(),
                      ),
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
