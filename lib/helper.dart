import 'dart:io';
import 'package:chats_app/widgets/text_source_sans_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:connectivity/connectivity.dart';

class Helper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final facebookLogin = FacebookLogin();

  listenNetworkStateChange() {
    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        // Got a new connectivity status!
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) {
          // I am connected to a mobile network.
          return true;
        } else {
          return false;
        }
      },
    );
    //Check despose
  }

  isConnectNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network // wifi
      print('is Connect Network');
      print(connectivityResult.toString());
    } else {
      print('is not ConnectNetwork');
    }
  }

  void signInByFacebook(BuildContext context) async {
    final result = await facebookLogin.logInWithReadPermissions(['email']);
    facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        print('Okkk');
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('cancelledByUser');
        break;
      case FacebookLoginStatus.error:
        print(result.errorMessage);
        break;
    }
  }

  void facebookLogOut(BuildContext context) {
    facebookLogin.logOut();
  }

  void signInWithGoogle(Function onComplete) async {
    AuthResult _authResult;
    String error;
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      AuthCredential authCredential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      _authResult = await _auth.signInWithCredential(authCredential);
      print(_authResult.user.email);
    } catch (e) {
      error = e;
    }
    onComplete(_authResult.user, error);
  }

  void signOut(BuildContext context) async {
    _auth.signOut();
  }

  void createNewAccount(
      String email, String password, Function onComplete) async {
    AuthResult _authResult;
    String error;
    if (email == '' || password == '') {
      error = 'Invalid email Or password';
      onComplete(_authResult.user, error);
      return;
    }
    if (!EmailValidator.validate(email, true)) {
      error = 'Email is not real!';
      onComplete(_authResult.user, error);
      return;
    }
    if (email != '' && password != '' && EmailValidator.validate(email, true)) {
      try {
        _authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      } catch (e) {
        error = e.toString();
        print(e);
      }
    }
    onComplete(_authResult.user, error);
  }

  void loginWithEmailPassword(
      String email, String password, Function onComplete) async {
    AuthResult _authResult;
    String error;
    if (email != '' && password != '') {
      try {
        _authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } catch (e) {
        error = (e as PlatformException).message;
      }
      onComplete(_authResult.user, error);
    }
  }

  void showAlertResult(
      IconData iconResult, String title, String error, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.red.withOpacity(0),
        child: Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  radius: 40,
                  child: Icon(
                    iconResult,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 80),
                child: Column(
                  children: <Widget>[
                    TextSourceSansPro(
                      textAlign: TextAlign.center,
                      title: title,
                      fontSize: 30,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextSourceSansPro(
                      textAlign: TextAlign.center,
                      title: error,
                      fontSize: 17,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 45,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.only(bottom: 20),
                  child: MaterialButton(
                    onPressed: () async {
                      // if (title != 'Error!') {
                      //   AuthResult _authResult =
                      //       await _auth.signInWithEmailAndPassword(
                      //           email: email, password: password);
                      //   if (_authResult != null) {
                      //     print(_authResult.user.email);
                      //   }
                      // } else {
                      //   Navigator.pop(context);
                      // }
                    },
                    child: TextSourceSansPro(
                      title: title != 'Error!' ? 'Login' : 'Cancel',
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void loadingDialog(BuildContext context) {
    showDialog(
      context: context,
      child: Container(
        width: 100,
        height: 100,
        child: Center(
          child: Platform.isIOS
              ? CupertinoActivityIndicator(
                  radius: 30,
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}

/**
 *  print(e);
        showAlertResult(
            context, email, password, Icons.mood_bad, 'Error!', contentError);
 *         indicatorDialog(context);

 * if (_authResult != null) {
          Navigator.pop(context);
          showAlertResult(context, email, password, Icons.mood, 'Success!',
              'Continue to login.!');
        }
 */
