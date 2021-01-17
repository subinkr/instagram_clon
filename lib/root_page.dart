import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon/login_page.dart';
import 'package:instagram_clon/tab_page.dart';
import 'package:firebase_core/firebase_core.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return StreamBuilder<User>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData) {
                return TabPage(snapshot.data);
              } else {
                return LoginPage();
              }
            }
        );
      },
    );
  }
}
