import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth with ChangeNotifier {
  String userName;
  String profileUrl;
  String userid; //this is the email
  String token; //this is the token generated.
  String userId;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool get isAuth {
    print(userId);
    return userId != null;
  }

  Future<bool> autoLogin() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    if (!s.containsKey('user') && !s.containsKey('pu')) {
      var p = s.getString('user');
      print('1:$p');
      return false;
    }
    userId = s.getString('user');
    profileUrl = s.getString('pu');
    userName = s.getString('name');
    print(s.getString('user'));
    print(s.getString('pu'));
    notifyListeners();
    return true;
  }

  Future<void> authenticate() async {
    var connectionCheck = await Connectivity().checkConnectivity();
    if (connectionCheck == ConnectivityResult.mobile || connectionCheck == ConnectivityResult.wifi) {
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication gs = await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          idToken: gs.idToken,
          accessToken: gs.accessToken,
        );

        UserCredential result = await _auth.signInWithCredential(credential);

        User user = _auth.currentUser;
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('user', user.uid.toString());
        userId = pref.getString('user');

        userid = user.email;
        pref.setString('pu', user.photoURL.toString());
        profileUrl = pref.getString('pu');
        pref.setString('name', user.displayName);
        userName = pref.getString('name');
        token = user.uid;

        print(user);
        notifyListeners();

        var url = 'https://neodemy-app.firebaseio.com/allusers/${user.uid}.json';
        try {
          var response = await http.put(url,
              body: json.encode({
                'userEmail': user.email,
                'userId': user.uid,
                'profileUrl': user.photoURL,
                'name': user.displayName,
              })); //patch is for appending the data, put is for putting new data with custom name.

        } catch (error) {
          print(error);
          Fluttertoast.showToast(msg: 'Server Problem. Please try again later.', toastLength: Toast.LENGTH_SHORT);
        }
      } else
        Fluttertoast.showToast(msg: 'Login to use the app!', toastLength: Toast.LENGTH_SHORT);
    } else
      Fluttertoast.showToast(msg: 'Turn on Mobile data or Wifi.', toastLength: Toast.LENGTH_SHORT);
  }

  void signOut() {
    SharedPreferences.getInstance().then((value) => value.clear().then((value) => value == true
        ? Fluttertoast.showToast(msg: 'User Credentials cleared')
        : Fluttertoast.showToast(msg: 'error')));
    googleSignIn.signOut();
  }
}
