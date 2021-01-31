import 'package:flutter/material.dart';
import 'package:flutter_app/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Comment> _posts = <Comment>[];

  Future<List<Comment>> fetchPosts() async {
    var url = 'https://jsonplaceholder.typicode.com/comments';
    var response = await http.get(url);

    var posts = <Comment>[];
    if (response.statusCode == 200) {
      var postsJson = json.decode(response.body);
      for (var postJson in postsJson) {
        posts.add(Comment.fromJson(postJson));
      }
    }
    return posts;
  }

  void initState() {
    fetchPosts().then((value) {
      setState(() {
        _posts.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Fetching Data"),
      ),
      body: ListView.builder(
        itemBuilder: (context, id) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 32.0,
                bottom: 32.0,
                left: 16.0,
                right: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _posts[id].title,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _posts[id].body,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: _posts.length,
      ),
    );
  }
}
