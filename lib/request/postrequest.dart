import 'package:todos/model/post.dart';

List<Post> postList = new List();
Future<List<Post>> fetchPost() async{
  final response=await get('https://jsonplaceholder.typicode.com/todos');
  List<dynamic>
}