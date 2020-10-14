import 'package:flutter/material.dart';
import 'package:todos/model/post.dart';
import 'package:todos/request/postrequest.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> getData;
  bool isLoading = false;
  Future loadData() async {
    await new Future.delayed(new Duration(seconds: 3));
  }

  @override
  void setState(fn) {
    super.setState(fn);
    print('SCrolling');
    isLoading = false;
  }

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'ToDos',
            style: TextStyle(
                color: Colors.black, fontFamily: 'PlayFAir', fontSize: 20),
          ),
        ),
        body: GridView.count(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
          children: List.generate(10, (index) {
            return ListTile(
              title: Text(getData[index].title),
              tileColor: getData[index].completed ? Colors.green : Colors.blue,
              contentPadding: EdgeInsets.all(5),
              subtitle: Text(
                'Completed Status ${getData[index].completed.toString()}',
                style: TextStyle(
                    color: Colors.yellow[300], fontFamily: 'PlayFAir'),
              ),
            );
          }),
        ),
      ),
    );
  }
}
