import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todos/model/post.dart';

List<Post> postList = new List();
Future<List<Post>> fetchData() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/todos');
  List<dynamic> values = List();
  values = json.decode(response.body);
  for (int i = 0; i < values.length; i++) {
    Map<String, dynamic> map = values[i];
    postList.add(Post.fromJson(map));
  }
  return postList;
}
