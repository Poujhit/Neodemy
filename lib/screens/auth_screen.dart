import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 95,
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            alignment: Alignment.center,
            child: AutoSizeText(
              'Neodemy',
              maxLines: 1,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Color(0xAA3f3f3f),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: 31,
              top: 4,
            ),
            child: AutoSizeText(
              'Learning Redefined',
              maxLines: 1,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xAA3f3f3f),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.40,
          ),
          Container(
            //alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.70,
            height: 50,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              color: Colors.white,
              elevation: 3,
              onPressed: () {
                //implement login feature.
              },
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Image.asset(
                        'assets/images/google.png',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        ' SIGN IN WITH GOOGLE',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
