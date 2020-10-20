import 'package:elearn_app/models/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WebMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

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
            Stack(
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
                              width: 60,
                              height: 60,
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
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
                            width: MediaQuery.of(context).size.width * 0.31,
                          ),
                          Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.31,
                          ),
                          RaisedButton(
                            onPressed: () async {
                              await Provider.of<Auth>(context, listen: false).authenticate();
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: Image.asset(
                                    'assets/images/google.png',
                                  ),
                                ),
                                Text(
                                  ' SIGN IN WITH GOOGLE  ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
