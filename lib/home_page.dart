import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User user;
  HomePage(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Clon', style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold
        )),
      ),
      body: _buildBody()
    );
  }

  _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text('Instagram에 오신 것을 환영합니다',
                  style: TextStyle(fontSize: 24),
                ),
                Padding(padding: EdgeInsets.all(8),),
                Text('사진과 동영상을 보려면 팔로우하세요',
                  style: TextStyle(fontSize: 16),
                ),
                Padding(padding: EdgeInsets.all(8),),
                SizedBox(
                  width: 260,
                  child: Card(
                    elevation: 4,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.all(4)),
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(user.photoURL),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Text(user.email, style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(user.displayName),
                        Padding(padding: EdgeInsets.all(8)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: Image.network('https://cdn.discordapp.com/attachments/800030329602965554/800030495218991114/dd.jpeg', fit: BoxFit.cover,),
                            ),
                            Padding(padding: EdgeInsets.all(1)),
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: Image.network('https://cdn.discordapp.com/attachments/800030329602965554/800030495218991114/dd.jpeg',fit: BoxFit.cover),
                            ),
                            Padding(padding: EdgeInsets.all(1)),
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: Image.network('https://cdn.discordapp.com/attachments/800030329602965554/800030495218991114/dd.jpeg', fit: BoxFit.cover),
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(4)),
                        Text('facebook 친구'),
                        Padding(padding: EdgeInsets.all(4)),
                        RaisedButton(
                          child: Text('팔로우'),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                        Padding(padding: EdgeInsets.all(4)),
                      ],
                    ),
                  ),
                )
              ],
            )
          )
        ),
      ),
    );
  }
}
