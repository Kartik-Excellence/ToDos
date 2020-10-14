import 'package:flutter/material.dart';
import 'package:todos/model/post.dart';
import 'package:todos/request/postrequest.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading;
  List<Post> getData;
  @override
  void initState() {
    super.initState();
    fetchPost().then((value) {
      setState(() {
        getData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        if (!isLoading) {
          isLoading = !isLoading;
          print("scrolling to nexty");
        }
      }
    });
    return GridView.count(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      crossAxisCount: 2,
      children: List.generate(getData.length, (index) {
        return ListTile(
          title: Text(getData[index].title),
          tileColor: getData[index].completed ? Colors.green : Colors.blue,
          contentPadding: EdgeInsets.all(5),
          subtitle: Text(
            'Completed Status ${getData[index].completed.toString()}',
            style: TextStyle(color: Colors.yellow[300], fontFamily: 'PlayFAir'),
          ),
        );
      }),
    );
  }
}
