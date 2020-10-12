import 'package:flutter/material.dart';
import 'package:todos/model/post.dart';
import 'package:todos/request/postrequest.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //bool isComplete = false;
  List<Post> getData;
  @override
  void initState() {
    super.initState();
    fetchData().then((value) {
      setState(() {
        getData = value;
        print(getData.length);
      });
    });
    print(getData.length)
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(50, (index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border(
              top: BorderSide(width: 3.0, color: Colors.yellow),
              left: BorderSide(width: 3, color: Colors.yellow),
              right: BorderSide(width: 3.0, color: Colors.yellow),
              bottom: BorderSide(width: 3.0, color: Colors.yellow),
            ),
          ),
          child: Text(
            'title',
            style: TextStyle(color: Colors.yellow),
          ),
        );
      }),
    );
  }
}
