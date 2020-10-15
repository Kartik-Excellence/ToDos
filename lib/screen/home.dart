import 'package:flutter/material.dart';
import 'package:todos/widget/homescreen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red[200],
            centerTitle: true,
            title: Text(
              'ToDos',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'PlayFAir', fontSize: 25,),
                  
            ),
            
            toolbarHeight: 70,
            toolbarOpacity: 1,
            bottom: PreferredSize(
              child: Text('Make Your ToDos Here',
              style: TextStyle(fontFamily: 'PlayFAir',)
              ,), preferredSize: Size.fromHeight(kToolbarHeight)),
            leading: GestureDetector(
                child: Icon(Icons.menu),
                onTap: () {
                  print('tap');
                }),
               // textTheme: TextTheme(headline1: Text),
                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(Icons.add)
                  ),
                    Padding(padding: EdgeInsets.only(right: 16),
                    child: Icon(Icons.delete),
                    )
                ],
                ),
              
        body: HomeScreen(),
      ),
    );
  }
}
