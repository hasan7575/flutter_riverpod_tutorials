import 'dart:convert';

import 'package:flutter_tutorials/models/post.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchPosts() async {

  try{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=5'),headers: {'Content-Type': 'application/json'}).timeout(const Duration(seconds: 10));
    if(response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((post) => Post.fromJson(post)).toList();
    }else{
      throw Exception('Failed to load posts');
    }
  }catch(e){
    throw Exception(e);
  }
}