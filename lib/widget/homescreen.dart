import 'package:flutter/material.dart';
import 'package:todos/model/post.dart';
import 'package:todos/request/postrequest.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  List<Post> printData = new List();
  List<Post> getData = new List();
  int start, end;
  Future loadData() async {
    await new Future.delayed(new Duration(seconds: 3));
    fetchPost().then((value) => {
      for(int i =0;i<10;i++){
        printData.add(value[i]),
      }
    });
    print('call after 10');
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollNotification) {
            if (!isLoading &&
                scrollNotification.metrics.pixels ==
                    scrollNotification.metrics.maxScrollExtent) {
              loadData();
              setState(() {
                isLoading = true;
              });
            }
            return false;
          },

          child: GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            children: List.generate(printData.length, (index) {
              return ListTile(
                title: Text(printData[index].title),
                tileColor:
                    printData[index].completed ? Colors.green : Colors.blue,
                contentPadding: EdgeInsets.all(5),
                subtitle: Text(
                  
                  'Completed Status ${printData[index].completed.toString()}',
                  style: TextStyle(
                      color: Colors.yellow[300], fontFamily: 'PlayFAir'),
                ),
              );
            }),
          ),
         
        ))
      ],
    );
  }
}
