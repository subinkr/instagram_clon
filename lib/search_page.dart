import 'package:flutter/material.dart';
import 'package:instagram_clon/create_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage()));
      }, child: Icon(Icons.create), backgroundColor: Colors.blue,)
    );
  }

  _buildBody() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildListItem(context, index);
        }
    );
  }

  _buildListItem(BuildContext context, int index) {
    return Image.network('https://cdn.discordapp.com/attachments/800030329602965554/800030495218991114/dd.jpeg', fit: BoxFit.cover);
  }
}
