import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

Future<List<Post>> fetchPosts() async {
  await Future.delayed(const Duration(seconds: 2));

  try {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=5'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts (Status Code: ${response.statusCode})');
    }
  } catch (e) {
    throw Exception('Failed to connect or parse data: $e');
  }
}