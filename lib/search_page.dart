import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon/create_page.dart';
import 'package:instagram_clon/detail_post_page.dart';

class SearchPage extends StatefulWidget {
  final User user;
  SearchPage(this.user);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage(widget.user)));
      }, child: Icon(Icons.create), backgroundColor: Colors.blue,)
    );
  }

  _buildBody() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('post').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(),);
        }
        var items = snapshot.data?.docs ?? [];

        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _buildListItem(context, items[index]);
            }
        );
      }
    );
  }

  _buildListItem(BuildContext context, document) {
    return Hero(
      tag: document['photoUrl'],
      child: Material(
        child: InkWell(
          onTap:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPostPage(document);
            }));
          },
          child: Image.network(document['photoUrl'], fit: BoxFit.cover)
        ),
      ),
    );
  }
}
