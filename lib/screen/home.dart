import 'package:flutter/material.dart';
import 'package:todos/model/post.dart';
import 'package:todos/request/postrequest.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int size;
  List<Post> getData;
  @override
  void initState() {
    super.initState();
    fetchPost().then((value) {
      setState(() {
        getData = value;
        size = getData.length;
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
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: List.generate(size, (index) {
            return ListTile(
              title: Text(getData[index].title),
              tileColor: getData[index].completed ? Colors.green : Colors.blue,
              contentPadding: EdgeInsets.all(5),
              subtitle: Text(
                  'Completed Status ${getData[index].completed.toString()}',style: TextStyle(color: Colors.yellow[300],fontFamily:'PlayFAir'),),
            );
            // return Container(
            //   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            //   margin: EdgeInsets.all(5),
            //   color: getData[index].completed ? Colors.green : Colors.blue,
            //   child: Text(
            //     getData[index].title,
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 15,
            //     ),
            //   ),
            // );
          }),
        ),
      ),
    );
  }
}
