import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:instagram_clon/tab_page.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Instagram clon', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
            Padding(padding: EdgeInsets.all(50)),
            SignInButton((Buttons.Google), onPressed: () {
                _handleSignIn().then((user) {
                print(user);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TabPage(user)));
              });
            })
          ],
        ),
      ),
    );
  }
  Future<User> _handleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    User user = (await _auth.signInWithCredential(
      GoogleAuthProvider.credential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken)
    )).user;
    return user;
  }
}
