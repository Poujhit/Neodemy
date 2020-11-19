import 'package:flutter/material.dart';
import 'package:elearn_app/models/auth.dart';
import 'package:provider/provider.dart';
import '../../models/auth.dart';

import 'package:universal_html/html.dart' as html;

class HeadWeb extends StatefulWidget {
  @override
  _HeadWebState createState() => _HeadWebState();
}

class _HeadWebState extends State<HeadWeb> {
  @override
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image.asset(
            'images/bg.png',
            height: 700,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Image.asset(
            'images/bgb.png',
            height: 700,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              SizedBox(
                width: 70,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Image.asset(
                        'assets/images/logo.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Neodemy',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.32,
                  ),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  !Provider.of<Auth>(context).isAuth
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width * 0.31,
                        )
                      : SizedBox(
                          width: MediaQuery.of(context).size.width * 0.36,
                        ),
                  RaisedButton(
                    onPressed: () async {
                      !Provider.of<Auth>(context, listen: false).isAuth
                          ? Provider.of<Auth>(context, listen: false).authenticate()
                          : Provider.of<Auth>(context, listen: false).signOut().then((_) {
                              html.window.location.reload();
                            });
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          width: 35,
                          height: 35,
                          child: Image.asset(
                            'assets/images/google.png',
                          ),
                        ),
                        Provider.of<Auth>(context).isAuth
                            ? Text(
                                ' SIGN OUT  ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              )
                            : Text(
                                ' SIGN IN WITH GOOGLE  ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 340,
          left: MediaQuery.of(context).size.width * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Learn Anything Anytime Anywhere',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Emerging Elearning Platform',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
